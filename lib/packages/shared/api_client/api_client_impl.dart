import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../api_middleware_bloc/api_client_bloc.dart';
import 'api_client_abs.dart';
import 'endpoints.dart';
import 'interceptor.dart';

class DioClientImpl implements ApiClientAbs {
  final ApiClientBloc apiClientBloc;

  final List<Interceptor> otherInterceptors;
  final BaseOptions? baseOptions;

  DioClientImpl({required this.apiClientBloc, this.otherInterceptors = const [], this.baseOptions}) {
    _dio.interceptors
      ..add(UserInterceptor(
        onRequestCallback: apiClientBloc.onRequestCallBack,
        onResponseCallback: apiClientBloc.onResponseCallBack,
        onErrorCallback: apiClientBloc.onErrorCallBack,
        onRetry: apiClientBloc.scheduleRetry,
      ),)
      ..addAll(otherInterceptors);

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
    if (baseOptions != null) {
      options = baseOptions!;
    }
  }

  static BaseOptions options = BaseOptions(
    baseUrl: KEndPoints.baseUrl,
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 40),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    validateStatus: (status) => status! < 500,
  );

  final _dio = Dio(options);
  final _dioStatusCodeCheck = Dio(options);

  @override
  Future<Response> statusCodeCheck(String path, {Map<String, dynamic>? params, Options? options}) {
    return _dioStatusCodeCheck.get(path, queryParameters: params, options: options);
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? params, Options? options}) {
    return _dio.get(path, queryParameters: params, options: options);
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? params, Options? options, data}) {
    return _dio.post(path, data: data, queryParameters: params, options: options);
  }

  @override
  Future<Response> postWithFiles(String path, {Map<String, dynamic>? params, Options? options, data}) {
    return _dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: params,
      options: options
        ?..headers?.addAll(
          {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data",
          },
        ),
    );
  }

  @override
  Future<Response> patch(String path, {Map<String, dynamic>? params, Options? options, data}) {
    return _dio.patch(path, data: data, queryParameters: params, options: options);
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? params, Options? options, data}) {
    return _dio.put(path, data: data, queryParameters: params, options: options);
  }

  @override
  Future<Response> delete(String path, {Map<String, dynamic>? params, Options? options, data}) {
    return _dio.delete(path, data: data, queryParameters: params, options: options);
  }

  @override
  Future<Response> request(
    String path, {
    data,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.request(
      path,
      data: data,
      queryParameters: params,
      options: options,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }
}
