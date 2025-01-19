import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-07-03
 * @description: 
 */

/// RSA工具类
class RSAUtil {
  static RSAUtil? _instance;
  dynamic k;

  RSAUtil._();

  /// 工厂方法
  static RSAUtil getInstance() {
    _instance ??= RSAUtil._();
    return _instance!;
  }

  /// 初始化
  Future init(String key) async {
    final keyFile = await rootBundle.loadString(key);
    k = RSAKeyParser().parse(keyFile);
  }


  /// 从base64初始化
  Future initFromBase64(String base64Key) async {
    String pkcs1 = base64ToPem(base64Key);
    k = RSAKeyParser().parse(pkcs1);
  }

  /// 加密
  String encode(String content) {
    final encrypter = Encrypter(RSA(publicKey: k));
    return encrypter.encrypt(content).base64;
  }

  /// 解密
  String decode(String content) {
    final encrypter = Encrypter(RSA(privateKey: k));
    return encrypter.decrypt(Encrypted.fromBase64(content));
  }

  /// 签名
  String sign(String content) {
    List<int> bytes = utf8.encode(content);
    Uint8List uint8List = Uint8List.fromList(bytes);
    return RSASigner(RSASignDigest.SHA256, privateKey: k)
        .sign(uint8List)
        .base64;
  }

  /// 验签
  bool verify(String content, String signature) {
    List<int> bytes = utf8.encode(content);
    Uint8List uint8List = Uint8List.fromList(bytes);
    return RSASigner(RSASignDigest.SHA256, publicKey: k)
        .verify(uint8List, Encrypted.fromBase64(signature));
  }

  /// RSA公私钥base64转为pkcs#1 pem格式
  String base64ToPem(String base64Key, {bool isPublicKey = true}) {
    // Base64 decode
    final keyBytes = base64.decode(base64Key);

    final pemBuffer = StringBuffer();
    if (isPublicKey) {
      pemBuffer.writeln('-----BEGIN PUBLIC KEY-----');
    } else {
      pemBuffer.writeln('-----BEGIN PRIVATE KEY-----');
    }

    final pemKey = base64.encode(keyBytes);
    for (int i = 0; i < pemKey.length; i += 64) {
      pemBuffer.writeln(pemKey.substring(i, (i + 64) < pemKey.length ? i + 64 : pemKey.length));
    }

    if (isPublicKey) {
      pemBuffer.writeln('-----END PUBLIC KEY-----');
    } else {
      pemBuffer.writeln('-----END PRIVATE KEY-----');
    }
    return pemBuffer.toString();
  }
}
