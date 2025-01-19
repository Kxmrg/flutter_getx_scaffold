import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;

/// @Author: iammty
/// @GitHub: https://github.com/iammty
/// @Description: AES  Util.
/// @Date: 2025/01/19
/// AES对称加密工具类
class AesUtil {
  // 生成32位随机字符串
  static String generateRandomString() {
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random rand = Random();
    String result = '';
    for (int i = 0; i < 32; i++) {
      result += characters[rand.nextInt(characters.length)];
    }
    return result;
  }

  // 随机生成 AES 密钥
  static encrypt.Key generateAesKey() {
    String randomString = generateRandomString();
    return encrypt.Key.fromUtf8(randomString);
  }

// 将 AES 密钥转换为 Base64 字符串
  static String aesKeyToString(encrypt.Key key) {
    return base64.encode(key.bytes); // 将 key 的字节数组转换为 Base64 编码的字符串
  }

  // 加密函数
  static String encryptWithAes(String message, encrypt.Key aesKey) {
    final encrypter = encrypt.Encrypter(
        encrypt.AES(aesKey, mode: encrypt.AESMode.ecb, padding: "PKCS7"));
    final encrypted = encrypter.encrypt(message);
    return encrypted.base64;
  }

  // 解密函数
  static String decryptWithAes(String encryptedMessage, encrypt.Key aesKey) {
    final encrypter = encrypt.Encrypter(
        encrypt.AES(aesKey, mode: encrypt.AESMode.ecb, padding: "PKCS7"));
    final decrypted = encrypter.decrypt64(encryptedMessage);
    return decrypted;
  }
}
