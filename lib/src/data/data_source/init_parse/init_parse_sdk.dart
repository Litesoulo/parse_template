import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../domain/use_case/use_case.dart';

class InitParseSdkUseCase implements UseCase {
  @override
  Future call({params}) async {
    await Parse().initialize(
      'appId',
      'serverUrl',
    );
  }
}
