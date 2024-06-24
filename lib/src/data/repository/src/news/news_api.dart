import '../../../data_source/parse_sdk/parse_sdk_base.dart';
import '../../../model/news.dart';

class NewsApi extends ParseSdkBase<News> {
  NewsApi() : super(objectConstructor: () => News());
}
