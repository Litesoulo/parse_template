import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/utility/logger/logger.dart';
import '../../../data/base/api_response.dart';
import '../../../data/data_source/repository/parse_sembast_repository_base.dart';

part '../../../../generated/src/presentation/common/store/parse_store_with_gallery_base.g.dart';

class ParseStoreBaseWithGallery<T extends ParseObject, G extends ParseObject> = _ParseStoreBaseWithGallery<T, G>
    with _$ParseStoreBaseWithGallery<T, G>;

abstract class _ParseStoreBaseWithGallery<T extends ParseObject, G extends ParseObject> with Store {
  final ParseSembastRepositoryBase<T> _repository;
  final ParseSembastRepositoryBase<G> _repositoryGallery;
  final T? Function(G) itemGetter;
  final T Function(T, List<G>) itemGallerySetter;

  _ParseStoreBaseWithGallery({
    required ParseSembastRepositoryBase<T> repository,
    required ParseSembastRepositoryBase<G> repositoryGallery,
    required this.itemGetter,
    required this.itemGallerySetter,
  })  : _repository = repository,
        _repositoryGallery = repositoryGallery;

  @observable
  ObservableFuture<ApiResponse<T>> itemsFuture = ObservableFuture.value(
    ApiResponse<T>(false, -1, null, null),
  );

  @observable
  ObservableFuture<ApiResponse<G>> itemsGalleryFuture = ObservableFuture.value(
    ApiResponse<G>(false, -1, null, null),
  );

  @observable
  List<T> itemsList = [];

  @observable
  List<G> itemsGalleryList = [];

  @action
  Future<void> getItems({bool? fromApi}) async {
    try {
      itemsFuture = _repository.getAll(fromApi: fromApi ?? false).asObservable();
      itemsGalleryFuture = ObservableFuture(
        _repositoryGallery.getAll(
          fromApi: fromApi ?? false,
          limit: 999,
        ),
      );

      final itemsFutureValue = await itemsFuture;
      final itemsGalleryFutureValue = await itemsGalleryFuture;

      if (!itemsFutureValue.succeed) {
        throw Exception(
          'Failed to get itemsList<${T.runtimeType}> with gallery, message: ${itemsFutureValue.error?.message}, type: ${itemsFutureValue.error?.type}',
        );
      }

      itemsList = itemsFutureValue.results ?? [];
      itemsGalleryList = itemsGalleryFutureValue.results ?? [];

      final itemsWithGalleryList = <T>[];

      for (final T item in itemsList) {
        final gallery = itemsGalleryList
            .where(
              (element) => itemGetter(element) == item,
            )
            .toList();

        itemGallerySetter(item, gallery);

        itemsWithGalleryList.add(item);
      }

      return;
    } catch (e, stackTrace) {
      Logger.e(e, stackTrace);
    }
  }
}
