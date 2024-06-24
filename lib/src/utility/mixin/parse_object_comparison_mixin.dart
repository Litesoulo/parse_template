import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart';

mixin CompareParseObjectsMixin<T extends ParseObject> on ParseObject {
  @override
  bool operator ==(Object other) {
    if (other is! T) return false;

    final thisJson = toJson();
    final otherJson = (other as ParseObject).toJson();

    return other.objectId == objectId && mapEquals(thisJson, otherJson);
  }

  @override
  int get hashCode => hash(objectId ?? '');
}
