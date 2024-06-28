import 'package:mobx/mobx.dart';

import '../../../../../core/utility/logger/logger.dart';
import '../../../../../data/base/api_response.dart';
import '../../../../../data/model/model.dart';
import '../../../../../data/repository/src/news/news_repository.dart';

part '../../../../../../generated/src/presentation/screen/src/news/store/news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  final NewsRepository _repository;

  _NewsStoreBase({
    required NewsRepository repository,
  }) : _repository = repository;

  @observable
  ObservableFuture<ApiResponse<News>> itemsFuture = ObservableFuture.value(
    ApiResponse<News>(
      false,
      -1,
      null,
      null,
    ),
  );

  @observable
  List<News> itemsList = [];

  @action
  getNews({bool? fromApi}) async {
    try {
      itemsFuture = ObservableFuture(_repository.getAll(fromApi: fromApi ?? false));

      final futureValue = await itemsFuture;

      if (futureValue.succeed) {
        itemsList = futureValue.results ?? [];
        return;
      }

      throw Exception(
        'Failed to get itemsList<${News.classname}>, message: ${futureValue.error?.message}, type: ${futureValue.error?.type}',
      );
    } catch (e, stackTrace) {
      Logger.e(e, stackTrace);
    }
  }
}
