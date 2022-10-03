import 'package:shared_preferences/shared_preferences.dart';

class AppConfigurationRepository {
  AppConfigurationRepository._privateConstructor();

  static final AppConfigurationRepository _instance =
      AppConfigurationRepository._privateConstructor();

  static AppConfigurationRepository get instance => _instance;

  SharedPreferences? _prefs;

  Future<SharedPreferences> _preferences() async {
    return SharedPreferences.getInstance();
  }

  Future<void> storeBoolean({required String key, required bool value}) async {
    _prefs ??= await _preferences();
    _prefs?.setBool(key, value);
  }

  Future<bool> getBoolean(
      {required String key, required bool defaultValue}) async {
    _prefs ??= await _preferences();
    return _prefs?.getBool(key) ?? defaultValue;
  }
}
