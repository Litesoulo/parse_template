import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../base/api_response.dart';

abstract class ParseSdkBase<T extends ParseObject> {
  final ParseObjectConstructor _objectConstructor;

  ParseSdkBase({
    required ParseObjectConstructor objectConstructor,
  }) : _objectConstructor = objectConstructor;

  Future<ApiResponse<T>> add(T item) async {
    return getApiResponse<T>(await item.save());
  }

  Future<ApiResponse<T>> addAll(List<T>? items) async {
    final List<T> responses = <T>[];

    for (final T item in items ?? []) {
      final ApiResponse<T> response = await add(item);

      if (!response.succeed) {
        return response;
      }

      response.results?.forEach(responses.add);
    }

    return ApiResponse<T>(true, 200, responses, null);
  }

  Future<ApiResponse<T>> getAll({
    List<String>? keysToInclude,
    int? limit,
  }) async {
    final QueryBuilder query = QueryBuilder(_objectConstructor());

    if (keysToInclude != null) {
      query.includeObject(keysToInclude);
    }

    if (limit != null) {
      query.setLimit(limit);
    }

    query.orderByDescending(keyVarCreatedAt);

    return getApiResponse<T>(await query.query());
  }

  Future<ApiResponse<T>> getById(String id) async {
    return getApiResponse<T>(await _objectConstructor().getObject(id));
  }

  Future<ApiResponse<T>> getNewerThan(DateTime date) async {
    final QueryBuilder<T> query = QueryBuilder(_objectConstructor.call() as T)..whereGreaterThan(keyVarCreatedAt, date);
    return getApiResponse<T>(await query.query());
  }

  Future<ApiResponse<T>> remove(T item) async {
    return getApiResponse<T>(await item.delete());
  }

  Future<ApiResponse<T>> update(T item) async {
    return getApiResponse<T>(await item.save());
  }

  Future<ApiResponse<T>> updateAll(List<dynamic>? items) async {
    final List<T> responses = <T>[];

    for (final T item in items ?? []) {
      final ApiResponse<T> response = await update(item);

      if (!response.succeed) {
        return response;
      }

      response.results?.forEach(responses.add);
    }

    return ApiResponse<T>(true, 200, responses, null);
  }
}
