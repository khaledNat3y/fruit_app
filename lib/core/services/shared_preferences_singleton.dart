import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> get init async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }
  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) {
    return _instance.setString(key, value);
  }
}
