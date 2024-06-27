import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'generated/strings.g.dart';
import 'src/core/config/router/app_router.dart';
import 'src/core/utility/logger/logger.dart';
import 'src/data/data_source/shared_preferences/shared_preferences_helper.dart';
import 'src/presentation/screen/screen.dart';
import 'src/sl.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await setPreferredOrientations();

  // Basic initialization
  sl.registerSingleton<Talker>(
    Talker(),
  );

  FlutterError.onError = Logger.logFlutterError;
  PlatformDispatcher.instance.onError = Logger.logPlatformDispatcherError;

  sl.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(
      preferences: await SharedPreferences.getInstance(),
    ),
  );

  // TODO Set initial locale
  String? storedLocale = loadLocaleFromStorage();
  if (storedLocale == null) {
    LocaleSettings.useDeviceLocale();
  } else {
    LocaleSettings.setLocaleRaw(storedLocale);
  }

  sl.registerSingleton<AppRouter>(
    AppRouter(),
  );

  runApp(const Application());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);
}

String? loadLocaleFromStorage() {
  // TODO add locale from storage logic
  return null;
}
