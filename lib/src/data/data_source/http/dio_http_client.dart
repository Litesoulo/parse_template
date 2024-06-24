import 'package:dio/dio.dart';

import 'dio_http_config.dart';

class DioHttpClient {
  DioHttpClient({
    required DioHttpConfig config,
    BaseOptions? baseOptions,
    List<Interceptor>? interceptors,
  }) : _dio = Dio(baseOptions?.copyWith(
              baseUrl: config.baseUrl,
            ) ??
            BaseOptions(
              baseUrl: config.baseUrl,
            )) {
    if (interceptors != null) {
      _dio.interceptors.addAll(
        interceptors,
      );
    }
  }

  final Dio _dio;

  Future<Response> request({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      _dio.request(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool fromCache = true,
  }) =>
      _dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

  Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

  Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

  Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
}
