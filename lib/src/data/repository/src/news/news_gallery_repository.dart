import '../../../base/api_response.dart';
import '../../../data_source/repository/parse_sembast_repository_base.dart';
import '../../../model/model.dart';

class NewsGalleryRepository extends ParseSembastRepositoryBase<NewsGallery> {
  NewsGalleryRepository({
    required super.api,
    required super.db,
  });

  @override
  Future<ApiResponse<NewsGallery>> getAll({
    bool fromApi = false,
    List<String>? keysToInclude,
    int? limit,
  }) {
    final galleryResponse = super.getAll(
      fromApi: fromApi,
      keysToInclude: [
        NewsGallery.keyIdNews,
      ],
      limit: limit,
    );

    return galleryResponse;
  }
}
