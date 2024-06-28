import 'package:mobx/mobx.dart';
import 'package:parse_template/src/core/utility/logger/logger.dart';

import '../../data/base/api_response.dart';

part '../../../generated/src/presentation/store/parse_store_base.g.dart';

class ParseStoreBase<T> = _ParseStoreBase<T> with _$ParseStoreBase<T>;

abstract class _ParseStoreBase<T> with Store {
  final dynamic _repository;

  _ParseStoreBase({
    required dynamic repository,
  }) : _repository = repository;

  @observable
  ObservableFuture<ApiResponse<T>> itemsFuture = ObservableFuture.value(
    ApiResponse<T>(
      false,
      -1,
      null,
      null,
    ),
  );

  @observable
  List<T> itemsList = [];

  @action
  Future<void> getItems({bool? fromApi}) async {
    try {
      itemsFuture = ObservableFuture(_repository.getAll(fromApi: fromApi ?? false));

      final futureValue = await itemsFuture;

      if (futureValue.succeed) {
        itemsList = futureValue.results ?? [];
        return;
      }

      throw Exception(
        'Failed to get itemsList<${T.runtimeType}>, message: ${futureValue.error?.message}, type: ${futureValue.error?.type}',
      );
    } catch (e, stackTrace) {
      Logger.e(e, stackTrace);
    }
  }
}
