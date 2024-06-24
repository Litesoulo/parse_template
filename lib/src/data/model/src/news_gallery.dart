import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/utility/mixin/parse_object_comparison_mixin.dart';
import 'news.dart';

class NewsGallery extends ParseObject with CompareParseObjectsMixin implements ParseCloneable {
  // Constructor: ------------------------------------------------------------------------------------------------------
  NewsGallery() : super(classname);
  NewsGallery.clone() : this();

  // Getters: ----------------------------------------------------------------------------------------------------------
  ParseFile? get picture => get<ParseFile?>(keyPicture);
  String get newsId => get<String?>(keyNewsId) ?? '';
  News? get idNews => get<News?>(keyIdNews);

  // Keys names: -------------------------------------------------------------------------------------------------------
  static const String classname = 'NewsGallery';

  static const String keyPicture = 'pictureFile';
  static const String keyNewsId = 'newsId';
  static const String keyIdNews = 'idNews';

  /// Mimic a clone due to Flutter not using reflection ----------------------------------------------------------------
  @override
  clone(Map map) => NewsGallery.clone()..fromJson(map as Map<String, dynamic>);
}
