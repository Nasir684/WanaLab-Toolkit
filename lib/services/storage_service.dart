import 'package:shared_preferences/shared_preferences.dart';
class StorageService {
  static SharedPreferences? _p;
  static Future<void> init() async { _p = await SharedPreferences.getInstance(); }
  static SharedPreferences get prefs => _p!;
}
