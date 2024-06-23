import 'package:mobx/mobx.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../data/data_source/init_data_source.dart';
import '../../../../../data/repository/init_repository.dart';
import '../../../../../sl.dart';
import '../../../../../utility/runner/data/initialization_callback.dart';
import '../../../../../utility/runner/data/initialization_status.dart';
import '../../../../../utility/runner/data/initialization_step.dart';
import '../../../init_stores.dart';

part 'application_store.g.dart';

// This is the class used by rest of your codebase
class ApplicationStore = _ApplicationStore with _$ApplicationStore;

// The store-class
abstract class _ApplicationStore with Store {
  @observable
  InitializationStatus initializationStatus = InitializationStatus.progress;

  @observable
  double initializationProgress = 0;

  List<InitializationStep> initializationSteps = [
    InitializationStep(
      title: 'Init data sources',
      init: () async => InitDataSourceUseCase()(),
    ),
    InitializationStep(
      title: 'Init repository',
      init: () async => InitRepositoryUseCase()(),
    ),
    InitializationStep(
      title: 'Init stores',
      init: () async => InitStoresUseCase()(),
    ),
  ];

  @action
  init() async {
    final Stopwatch stopwatch = Stopwatch()..start();
    InitializationStep currentStep = initializationSteps.first;
    final callback = InitializationCallback(
      talker: sl<Talker>(),
    );

    callback.onStart(initializationSteps);
    try {
      for (InitializationStep step in initializationSteps) {
        final Stopwatch requestStopWatch = Stopwatch()..start();
        currentStep = step;
        await step.init();
        requestStopWatch.stop();

        callback.onStepSuccess(
          initializationSteps,
          step,
          requestStopWatch.elapsed,
        );
      }
    } catch (error, stackTrace) {
      // Initialization error
      callback.onError(
        initializationSteps,
        currentStep,
        error,
        stackTrace,
      );
    }

    // All steps succeed
    stopwatch.stop();
    callback.onSuccess(
      stopwatch.elapsed,
    );
  }
}
