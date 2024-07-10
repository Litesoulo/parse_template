import 'package:mobx/mobx.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../core/enum/app_open_status.dart';
import '../../../../../core/services/push_notification/fcm_service.dart';
import '../../../../../core/utility/runner/data/initialization_callback.dart';
import '../../../../../core/utility/runner/data/initialization_step.dart';
import '../../../../../data/data_source/init_data_source.dart';
import '../../../../../data/data_source/shared_preferences/shared_preferences_helper.dart';
import '../../../../../data/repository/init_repository.dart';
import '../../../../../sl.dart';
import '../../../init_stores.dart';

part '../../../../../../generated/src/presentation/screen/src/application/store/application_store.g.dart';

class ApplicationStore = _ApplicationStore with _$ApplicationStore;

abstract class _ApplicationStore with Store {
  @observable
  AppOpenStatus status = AppOpenStatus.loading;

  @observable
  double initializationProgress = 0;

  List<InitializationStep> initializationSteps = [
    InitializationStep(
      title: 'Init data sources',
      init: () async => InitDataSourceUseCase()(),
    ),
    InitializationStep(
      title: 'Init services',
      init: () async => FCMService().initialize(),
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
      status = AppOpenStatus.error;

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

    if (sl<SharedPreferencesHelper>().isFirstAppLaunch) {
      status = AppOpenStatus.firstLaunch;

      sl<SharedPreferencesHelper>().setIsFirstAppLaunch(false);
    } else {
      status = AppOpenStatus.unauthorized;
    }
  }
}
