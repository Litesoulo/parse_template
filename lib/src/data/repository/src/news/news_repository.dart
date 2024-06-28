import '../../../data_source/repository/parse_sembast_repository_base.dart';
import '../../../model/model.dart';

class NewsRepository extends ParseSembastRepositoryBase<News> {
  NewsRepository({
    required super.api,
    required super.db,
  });
}
