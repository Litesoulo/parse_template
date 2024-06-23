import 'package:mobx/mobx.dart';

import '../../../../../utility/runner/data/initialization_status.dart';
import '../../../../../utility/runner/data/initialization_step.dart';

part 'application_store.g.dart';

// This is the class used by rest of your codebase
class ApplicationStore = _ApplicationStore with _$ApplicationStore;

// The store-class
abstract class _ApplicationStore with Store {
  @observable
  InitializationStatus initializationStatus = InitializationStatus.progress;

  @observable
  double initializationProgress = 0;

  List<InitializationStep> initializationSteps = [];

  @action
  init() async {}
}
