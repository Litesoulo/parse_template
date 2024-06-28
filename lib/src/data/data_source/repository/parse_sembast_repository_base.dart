import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../base/api_response.dart';
import '../parse_sdk/parse_sdk_base.dart';
import '../sembast/sembast_parse_db_base.dart';

class ParseSembastRepositoryBase<T extends ParseObject> {
  final ParseSdkBase<T> _api;
  final SembastParseDbBase<T> _db;

  ParseSembastRepositoryBase({
    required ParseSdkBase<T> api,
    required SembastParseDbBase<T> db,
  })  : _api = api,
        _db = db;

  Future<ApiResponse<T>> getAll({
    bool fromApi = false,
    List<String>? keysToInclude,
    int? limit,
  }) async {
    if (fromApi) {
      final apiResponse = await _api.getAll(
        keysToInclude: keysToInclude,
        limit: limit,
      );

      // Update database values
      await _db.removeAll();
      await _db.addAll(apiResponse.results);

      return apiResponse;
    }

    final dbResponse = await _db.getAll();

    return dbResponse;
  }
}
