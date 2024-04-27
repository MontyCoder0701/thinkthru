import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static late final SharedPreferences _instance;

  static Future<void> initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return _instance.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }
}
