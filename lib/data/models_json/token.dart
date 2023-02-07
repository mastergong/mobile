import 'dart:convert';

import '../../core/local/key_value_storage_base.dart';

class TokenInfo {
  static Future<DateTime?> getExpiryDate() async {
    var tokenlist = await Future.wait([
      KeyValueStorageBase().getAuthToken(),
    ]);

    var token = tokenlist[0];

    if (token.isEmpty) return null;

    final Map<String, dynamic> payload = parseJwtPayLoad(token);
    if (payload['exp'] != null) {
      return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)
          .add(Duration(seconds: payload["exp"]));
    }
    return null;
  }

  static Future<bool> isExpired() async {
    final DateTime? expirationDate = await getExpiryDate();
    if (expirationDate != null) {
      return DateTime.now().isAfter(expirationDate);
    } else {
      return false;
    }
  }

  static Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static Map<String, dynamic> parseJwtHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[0]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Wrong base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
