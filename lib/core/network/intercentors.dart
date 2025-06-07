import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerIntercentor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("Request started ${options.path}");
    options.headers["Content-Type"] = "application/json";
    return handler.next(options);
  }

  @override
  void onResponse(Response options, ResponseInterceptorHandler handler) {
    log("Response received ${options.data}");
    return handler.next(options);
  }

  @override
  void onError(DioException options, ErrorInterceptorHandler handler) {
    log("Error occurred ${options.error}");
    return handler.next(options);
  }
}
