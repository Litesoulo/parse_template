import 'package:talker_flutter/talker_flutter.dart';

import 'initialization_step.dart';

class InitializationCallback {
  final Talker _talker;

  const InitializationCallback({
    required Talker talker,
  }) : _talker = talker;

  void onStart(
    List<InitializationStep> steps,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Initialization start')
      ..writeln('Steps length [${steps.length}].');

    _talker.info(stringBuffer.toString());
  }

  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Start initialization step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Duration: ${duration.inMicroseconds}.');

    _talker.info(stringBuffer.toString());
  }

  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Success initialization step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Duration: ${duration.inMicroseconds}.');

    _talker.info(stringBuffer.toString());
  }

  void onSuccess(
    Duration duration,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Initialization success.')
      ..writeln('Duration: ${duration.inMicroseconds}.');

    _talker.info(stringBuffer.toString());
  }

  void onError(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  ) {
    final int index = steps.indexOf(step);
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Initialization failed on the step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Error: $error')
      ..writeln('StackTrace: $stackTrace');

    _talker.info(stringBuffer.toString());
  }
}
