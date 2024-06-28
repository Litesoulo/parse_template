import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'api_error.dart';

class ApiResponse<T> {
  ApiResponse(this.succeed, this.statusCode, this.results, this.error)
      : count = results?.length ?? 0,
        result = null;

  final bool succeed;
  final int statusCode;
  final List<T>? results;
  final T? result;
  int count;
  final ApiError? error;

  ApiResponse<T> copyWith({
    bool? succeed,
    int? statusCode,
    List<T>? results,
    T? result,
    int? count,
    ApiError? error,
  }) {
    return ApiResponse<T>(
      succeed ?? this.succeed,
      statusCode ?? this.statusCode,
      results ?? this.results,
      error ?? this.error,
    )..count = count ?? this.count;
  }
}

ApiResponse<T> getApiResponse<T extends ParseObject>(ParseResponse? response) {
  return ApiResponse(
    response?.success ?? false,
    response?.statusCode ?? 0,
    response?.results?.cast<T>(),
    getApiError(response?.error),
  );
}

ApiError? getApiError(ParseError? response) {
  if (response == null) {
    return null;
  }

  return ApiError(
    response.code,
    response.message,
    response.exception,
    response.type,
  );
}
