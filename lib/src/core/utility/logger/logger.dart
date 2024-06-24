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
}
