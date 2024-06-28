import '../../../../../data/model/model.dart';
import '../../../../store/parse_store_with_gallery_base.dart';

class NewsStore extends ParseStoreBaseWithGallery<News, NewsGallery> {
  NewsStore({
    required super.repository,
    required super.repositoryGallery,
  }) : super(
          itemGetter: (newsGallery) => newsGallery.idNews,
          itemGallerySetter: (p0, p1) {
            p0.galleryNews = p1;
            return p0;
          },
        );
}
