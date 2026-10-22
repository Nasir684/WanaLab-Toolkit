import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    final prefs = _prefs;
    if (prefs == null) {
      throw StateError('StorageService has not been initialized. Run StorageService.init() first.');
    }
    return prefs;
  }

  static Future<int> getInt(String key, {int defaultValue = 0}) async {
    await init();
    return instance.getInt(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await init();
    await instance.setInt(key, value);
  }

  static Future<List<String>> getStringList(String key) async {
    await init();
    return instance.getStringList(key) ?? <String>[];
  }

  static Future<void> setStringList(String key, List<String> values) async {
    await init();
    await instance.setStringList(key, values);
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    await init();
    return instance.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await init();
    await instance.setBool(key, value);
  }

  static Future<String> getString(String key, {String defaultValue = ''}) async {
    await init();
    return instance.getString(key) ?? defaultValue;
  }

  static Future<void> setString(String key, String value) async {
    await init();
    await instance.setString(key, value);
  }
}
