import 'dart:convert';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  static const secureStorage = FlutterSecureStorage();

  void initDatabase() async {
    await Hive.initFlutter();

    final encryprionKey = await secureStorage.read(key: 'encryption_key');
    if (encryprionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'encryption_key',
        value: base64UrlEncode(key),
      );
    }
  }

  Future<Uint8List> _getDecryptionKey() async {
    final key = await secureStorage.read(key: 'encryption_key');
    return base64Url.decode(key!);
  }

  void setToken(String token) async {
    final encryptionKey = await _getDecryptionKey();

    final encryptedBox = await Hive.openBox(
      'jwtToken',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );

    if (!encryptedBox.containsKey('token')) {
      encryptedBox.put('token', token);
    }
  }

  Future<String> getToken() async {
    final encryptionKey = await _getDecryptionKey();

    final encryptedBox = await Hive.openBox(
      'jwtToken',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    String token = encryptedBox.get('token');

    return token;
  }
}
