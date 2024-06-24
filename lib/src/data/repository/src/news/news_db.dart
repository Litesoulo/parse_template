import '../../../data_source/sembast/sembast_parse_db_base.dart';
import '../../../model/news.dart';

class NewsDb extends SembastParseDbBase<News> {
  NewsDb({
    required super.sembastClient,
    required super.contructor,
  });
}
