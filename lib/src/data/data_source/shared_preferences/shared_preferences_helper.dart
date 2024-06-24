import 'package:shared_preferences/shared_preferences.dart';

import 'prefs.dart';

class SharedPreferencesHelper {
  final SharedPreferences _preferences;

  SharedPreferencesHelper({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  Future<void> clear() async => await _preferences.clear();

  // Is first app launch: ------------------------------------------------------
  bool get isFirstAppLaunch => _preferences.getBool(Prefs.isFirstAppLaunch) ?? true;

  Future<bool> setIsFirstAppLaunch(value) async => await _preferences.setBool(Prefs.isFirstAppLaunch, value);
}
