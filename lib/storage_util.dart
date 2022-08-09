import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async {
    _prefsInstance ??= await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  // call this method from iniState() function of mainApp().
  static void init() async {
    _prefsInstance = await _instance;
  }

  static String getString(String key, [String? defaultValue]) {
    
    if (_prefsInstance == null) init();
    return _prefsInstance?.getString(key) ?? defaultValue ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool? value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value ?? false);
  }

  static bool getBool(String key) {
    if (_prefsInstance == null) init();
    return _prefsInstance?.getBool(key) ?? false;
  }

  static Future<bool>? remove(String key) {
    return _prefsInstance?.remove(key);
  }
}
