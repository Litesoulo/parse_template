import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/utility/mixin/parse_object_comparison_mixin.dart';
import 'news_gallery.dart';

class News extends ParseObject with CompareParseObjectsMixin implements ParseCloneable {
  // Constructor: ------------------------------------------------------------------------------------------------------
  News() : super(classname);
  News.clone() : this();

  // Getters: ----------------------------------------------------------------------------------------------------------
  String get name => get<String?>(keyTitle) ?? '';
  String get description => get<String?>(keyDescription) ?? '';
  DateTime get date => get<DateTime?>(keyDate) ?? DateTime(0);
  String get id1c => get<String?>(keyId1c) ?? '';
  bool get isVisible => get<bool?>(keyIsVisible) ?? false;
  num get priority => get<num?>(keyPriority) ?? 0;

  // Gallery
  List<NewsGallery> get galleryNews => get<List<NewsGallery>>(keyGalleryNews) ?? [];
  set galleryNews(List<NewsGallery> galleryNews) => set<List<NewsGallery>>(keyGalleryNews, galleryNews);

  // Keys names: -------------------------------------------------------------------------------------------------------
  static const String classname = 'News';

  static const String keyTitle = 'title';
  static const String keyDescription = 'description';
  static const String keyId1c = 'id1c';
  static const String keyDate = 'newsDate';
  static const String keyIsVisible = 'isVisible';
  static const String keyPriority = 'priority';
  static const String keyGalleryNews = 'galleryNews';

  /// Mimic a clone due to Flutter not using reflection ----------------------------------------------------------------
  @override
  clone(Map map) => News.clone()..fromJson(map as Map<String, dynamic>);
}
