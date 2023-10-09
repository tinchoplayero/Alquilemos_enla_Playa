

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool getPrimeraVez(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  setPrimeraVez(String key, bool value) {
    _prefs?.setBool(key, value);
  }
}