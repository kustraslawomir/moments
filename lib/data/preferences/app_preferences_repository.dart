import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesRepository {
  AppPreferencesRepository._privateConstructor();

  static final AppPreferencesRepository _instance =
      AppPreferencesRepository._privateConstructor();

  static AppPreferencesRepository get instance => _instance;

  SharedPreferences? _prefs;

  Future<SharedPreferences> _preferences() async {
    if (_prefs != null) {
      return Future<SharedPreferences>.value(_prefs);
    }
    return SharedPreferences.getInstance();
  }

  Future<void> storeBoolean({required String key, required bool value}) async {
    await _preferences().then((SharedPreferences preferences) {
      preferences.setBool(key, value);
    });
  }

  Future<bool> getBoolean(
      {required String key, required bool defaultValue}) async {
    return _preferences().then((SharedPreferences preferences) {
      return preferences.getBool(key) ?? defaultValue;
    });
  }

  Future<void> storeInt({required String key, required int value}) async {
    await _preferences().then((SharedPreferences preferences) {
      preferences.setInt(key, value);
    });
  }

  Future<int> getInt({required String key, required int defaultValue}) async {
    return _preferences().then((SharedPreferences preferences) {
      return preferences.getInt(key) ?? defaultValue;
    });
  }
}
