import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCashing {
  static Future<void> setSecuerString(
      {required String key, required String value}) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// get  Strings with Secure
  /// exampel secure token and passwords
  static Future<String> getSecuerString({
    required String key,
  }) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? "";
  }
}
