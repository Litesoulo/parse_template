import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../sl.dart';

class Logger {
  /// Helper static method to log a flutter error [FlutterError.onError]
  /// like widget overflow, etc.
  static void logFlutterError(
    FlutterErrorDetails details,
  ) =>
      sl<Talker>().error(
        details.toStringShort(),
        details.exception,
        details.stack,
      );

  /// Helper static method to log a platform dispatcher error
  /// like native code errors
  static bool logPlatformDispatcherError(Object exception, StackTrace stackTrace) {
    sl<Talker>().error(
      exception.toString(),
      exception,
      stackTrace,
    );

    return true;
  }

  static void i(Object message) => sl<Talker>().info(message);

  static void w(Object message, [StackTrace? stackTrace]) => sl<Talker>().warning(message, stackTrace);

  static void e(Object message, [StackTrace? stackTrace]) => sl<Talker>().error(message, stackTrace);

  static void d(Object message) => sl<Talker>().debug(message);
}
