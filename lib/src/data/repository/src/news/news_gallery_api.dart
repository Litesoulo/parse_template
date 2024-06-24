import '../../../data_source/parse_sdk/parse_sdk_base.dart';
import '../../../model/src/news_gallery.dart';

class NewsGalleryApi extends ParseSdkBase<NewsGallery> {
  NewsGalleryApi() : super(objectConstructor: () => NewsGallery());
}
