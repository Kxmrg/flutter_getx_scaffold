import 'dart:convert';

//Decode a string JWT token into a `Map<String, dynamic>`
class JwtDecoder {
  //Decode a string JWT token into a `Map<String, dynamic>`
  static Map<String, dynamic>? decode(String token) {
    final splitToken = token.split(".");
    if (splitToken.length != 3) {
      throw const FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1];
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);

      return decodedPayload;
    } catch (error) {
      throw const FormatException('Invalid payload');
    }
  }

  /// Returns null if the token is not valid
  static Map<String, dynamic>? tryDecode(String token) {
    try {
      return decode(token);
    } catch (error) {
      return null;
    }
  }

  /// Returns true if the token is valid, false if it is expired.
  static bool isExpired(String token) {
    final expirationDate = getExpirationDate(token);
    // If the current date is after the expiration date, the token is already expired
    return DateTime.now().isAfter(expirationDate);
  }

  /// Returns token expiration date
  static DateTime getExpirationDate(String token) {
    final decodedToken = decode(token)!;

    final expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
        .add(Duration(seconds: decodedToken['exp'].toInt()));
    return expirationDate;
  }

  /// Returns token issuing date (iat)
  static Duration getTokenTime(String token) {
    final decodedToken = decode(token)!;

    final issuedAtDate = DateTime.fromMillisecondsSinceEpoch(0)
        .add(Duration(seconds: decodedToken["iat"]));
    return DateTime.now().difference(issuedAtDate);
  }

  /// Returns remaining time until expiry date.
  static Duration getRemainingTime(String token) {
    final expirationDate = getExpirationDate(token);

    return expirationDate.difference(DateTime.now());
  }
}
