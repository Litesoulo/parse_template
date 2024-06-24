import '../../../base/api_response.dart';
import '../../../model/model.dart';
import 'news_api.dart';
import 'news_db.dart';
import 'news_gallery_api.dart';
import 'news_gallery_db.dart';

class NewsRepository {
  final NewsApi _newsApi;
  final NewsGalleryApi _newsGalleryApi;
  final NewsDb _newsDb;
  final NewsGalleryDb _newsGalleryDb;

  NewsRepository({
    required NewsApi newsApi,
    required NewsGalleryApi newsGalleryApi,
    required NewsGalleryDb newsGalleryDb,
    required NewsDb newsDb,
  })  : _newsApi = newsApi,
        _newsGalleryApi = newsGalleryApi,
        _newsGalleryDb = newsGalleryDb,
        _newsDb = newsDb;

  List<News> mergeNewsWithGallery(List<News>? newsList, List<NewsGallery>? galleryList) {
    final newsWithGallery = <News>[];

    for (final News item in newsList ?? []) {
      final gallery = galleryList
              ?.where(
                (element) => element.idNews == item,
              )
              .toList() ??
          [];

      item.galleryNews = gallery;

      newsWithGallery.add(item);
    }

    return newsWithGallery;
  }

  Future<ApiResponse<News>> getAll({bool fromApi = false}) async {
    if (fromApi) {
      final newsResponse = await _newsApi.getAll();
      final newsGalleryResponse = await _newsGalleryApi.getAll();

      if (!newsResponse.succeed) {
        return newsResponse;
      }

      final galleryList = newsGalleryResponse.results;

      final newsWithGallery = mergeNewsWithGallery(newsResponse.results, galleryList);

      await removeAll();

      await _newsDb.addAll(newsWithGallery);
      await _newsGalleryDb.addAll(galleryList);

      return newsResponse.copyWith(
        results: newsWithGallery,
      );
    }

    final newsResponse = await _newsDb.getAll();
    final newsGalleryResponse = await _newsGalleryDb.getAll();

    final newsWithGallery = mergeNewsWithGallery(newsResponse.results, newsGalleryResponse.results);

    return newsResponse.copyWith(
      results: newsWithGallery,
    );
  }

  Future<void> removeAll() async {
    await _newsDb.removeAll();
    await _newsGalleryDb.removeAll();
  }
}
