import '../../../data_source/sembast/sembast_parse_db_base.dart';
import '../../../model/news_gallery.dart';

class NewsGalleryDb extends SembastParseDbBase<NewsGallery> {
  NewsGalleryDb({
    required super.sembastClient,
    required super.contructor,
  });
}
