import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/config/router/app_router.dart';
import 'src/presentation/screen/screen.dart';
import 'src/sl.dart';
import 'src/utility/logger/logger.dart';

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
