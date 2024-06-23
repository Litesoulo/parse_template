import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late final SharedPreferences _preferences;

  SharedPreferencesHelper() {
    _init();
  }

  _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  clear() async => await _preferences.clear();
}
