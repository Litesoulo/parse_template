import '../../../../../data/model/model.dart';
import '../../../../common/store/parse_store_with_gallery_base.dart';

class NewsStore extends ParseStoreBaseWithGallery<News, NewsGallery> {
  NewsStore({
    required super.repository,
    required super.repositoryGallery,
  }) : super(
          itemGetter: (newsGallery) => newsGallery.idNews,
          itemGallerySetter: (item, itemGallery) {
            item.galleryNews = itemGallery;
            return item;
          },
        );
}
