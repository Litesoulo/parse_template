import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import 'init_parse/init_parse_sdk.dart';
import 'sembast/sembast_client.dart';
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
      databaseName: 'databaseName',
      databasePath: 'databasePath',
      encryptionKey: 'encryptionKey',
    );

    sl.registerSingleton<SembastClient>(sembastClient);

    // TODO Init http client

    // TODO Init parse sdk
    await InitParseSdkUseCase()();
  }
}
