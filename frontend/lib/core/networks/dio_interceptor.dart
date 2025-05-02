import 'package:dio/dio.dart';
import 'dart:async';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error: ${err.response?.statusCode} ${err.message}');
    // Retry mechanism or custom error handling
    if (err.response?.statusCode == 401) {
      // Handle token refresh logic here if needed
    }
    super.onError(err, handler);
  }
}