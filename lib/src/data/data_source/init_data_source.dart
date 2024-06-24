import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'http/dio_http_client.dart';
import 'http/dio_http_config.dart';
import 'init_parse/init_parse_sdk.dart';
import 'sembast/sembast_client.dart';
import 'sembast/sembast_constants.dart';
import 'shared_preferences/shared_preferences_helper.dart';

class InitDataSourceUseCase implements UseCase {
  @override
  Future<void> call({params}) async {
    // TODO Init shared preferences helper
    sl.registerSingleton<SharedPreferencesHelper>(
      SharedPreferencesHelper(),
    );

    // TODO Init sembast
    final sembastClient = await SembastClient.provideDatabase(
      databaseName: SembastConstants.dbName,
      databasePath: kIsWeb ? '/assets/db' : (await getApplicationDocumentsDirectory()).path,
      encryptionKey: '.9qgY:`;_;jWwO#[3_=4,b;M{=O)[N',
    );

    sl.registerSingleton<SembastClient>(sembastClient);

    // TODO Init http client
    sl.registerSingleton<DioHttpClient>(
      DioHttpClient(
        config: DioHttpConfig(baseUrl: ''),
      ),
    );

    // TODO Init parse sdk
    await InitParseSdkUseCase()();
  }
}
