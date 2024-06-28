import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/use_case/use_case.dart';
import '../../sl.dart';
import '../model/model.dart';
import '../repository/src/news/news_api.dart';
import '../repository/src/news/news_db.dart';
import '../repository/src/news/news_gallery_api.dart';
import '../repository/src/news/news_gallery_db.dart';
import '../repository/src/news/news_gallery_repository.dart';
import '../repository/src/news/news_repository.dart';
import 'http/dio_http_client.dart';
import 'http/dio_http_config.dart';
import 'parse_sdk/init_parse_sdk.dart';
import 'sembast/sembast_client.dart';
import 'sembast/sembast_constants.dart';

class InitDataSourceUseCase implements UseCase {
  @override
  Future<void> call({params}) async {
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

    // Init repositories
    sl.registerSingleton<NewsRepository>(
      NewsRepository(
        api: NewsApi(),
        db: NewsDb(
          sembastClient: sembastClient,
          constructor: () => News(),
        ),
      ),
    );

    sl.registerSingleton<NewsGalleryRepository>(
      NewsGalleryRepository(
        api: NewsGalleryApi(),
        db: NewsGalleryDb(
          sembastClient: sembastClient,
          constructor: () => NewsGallery(),
        ),
      ),
    );
  }
}
