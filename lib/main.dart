import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/core/config/router/app_router.dart';
import 'src/core/services/app_info/app_info_service.dart';
import 'src/core/utility/logger/logger.dart';
import 'src/data/data_source/shared_preferences/shared_preferences_helper.dart';
import 'src/presentation/screen/screen.dart';
import 'src/sl.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PackageInfoService();

  await setPreferredOrientations();

  // Basic initialization
  sl.registerSingleton<Talker>(
    Talker(
        // Todo add talker observer to save logs
        // observer: TalkerObserver(),
        ),
  );

  FlutterError.onError = Logger.logFlutterError;
  PlatformDispatcher.instance.onError = Logger.logPlatformDispatcherError;

  sl.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(
      preferences: await SharedPreferences.getInstance(),
    ),
  );

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
