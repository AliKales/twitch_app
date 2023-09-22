import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final class CSharedPreferences {
  static SharedPreferences? _preferences;

  static FutureOr<void> init() async {
    if (_preferences != null) return;

    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(SPKeys key, String value) async {
    await init();

    await _preferences?.setString(key.name, value);
  }

  static Future<void> setMap(SPKeys key, Map<String, dynamic> value) async {
    String encodedValue = jsonEncode(value);
    await setString(key, encodedValue);
  }

  static Future<String?> getString(SPKeys key) async {
    await init();

    return _preferences?.getString(key.name);
  }

  static Future<Map<String, dynamic>?> getMap(SPKeys key) async {
    String? encodedValue = await getString(key);
    if (encodedValue == null) return null;

    return jsonDecode(encodedValue);
  }
}

enum SPKeys {
  user,
}
