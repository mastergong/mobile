import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyValueStorageBase {
  FlutterSecureStorage? _secureStorage;

  static const _authcoopCode = 'authoopCode';
  static const _authTokenKey = 'authTokenKey';
  static const _authSubTokenKey = 'authSubTokenKey';
  static const _authRefreshTokenKey = 'authRefreshTokenKey';
  static const _authFirstApp = 'Firstapp';

  KeyValueStorageBase() {
    _secureStorage ??= const FlutterSecureStorage();
  }
  // firstApp CoopCode
  void setFirstApp() {
    setEncrypted(_authFirstApp, '1');
  }

  Future<String> getFirstApp() async {
    return await getEncrypted(_authFirstApp) ?? '';
  }

  // set-get CoopCode
  void setCoopCode(String code) {
    setEncrypted(_authcoopCode, code);
  }

  Future<String> getCoopCoden() async {
    return await getEncrypted(_authcoopCode) ?? '';
  }

  // set-get AuthSubToken
  void setAuthSubToken(String token) {
    setEncrypted(_authSubTokenKey, token);
  }

  Future<String> getAuthSubToken() async {
    return await getEncrypted(_authSubTokenKey) ?? '';
  }

  // set-get AuthToken
  void setAuthToken(String token) {
    setEncrypted(_authTokenKey, token);
  }

  Future<String> getAuthToken() async {
    return await getEncrypted(_authTokenKey) ?? '';
  }

  // set-get RefreshToken
  Future<String> getRefreshToken() async {
    return await getEncrypted(_authRefreshTokenKey) ?? '';
  }

  void setRefreshToken(String token) {
    setEncrypted(_authRefreshTokenKey, token);
  }
  //-----------------------------------------------------------

  Future<String?> getEncrypted(String key) {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return Future<String?>.value();
    }
  }

  Future<bool> setEncrypted(String key, String value) {
    try {
      _secureStorage!.write(key: key, value: value);
      return Future.value(true);
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return Future.value(false);
    }
  }

  Future<bool> clearEncrypted() async {
    try {
      await _secureStorage!.deleteAll();
      return true;
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return false;
    }
  }
}
