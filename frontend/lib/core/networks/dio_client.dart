import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/networks/dio_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@LazySingleton()
@injectable
class DioClient {
  final Dio dio = Dio();

  static final DioClient _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  static Dio get instance => _singleton.dio;

  String baseurl = dotenv.get('BASEURL', fallback: 'http://192.168.1.106:8080');

  DioClient._internal() {
    dio.options.baseUrl = baseurl;
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          //options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          print('Error: ${error.response?.statusCode} ${error.message}');
          return handler.next(error);
        },
      ),
    );


    dio.interceptors.add(
      kDebugMode ? PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      request: true,
      filter: (options, args) {
        return true;
      },
      error: true,
      compact: true,
      maxWidth: 90,
    ) : DioInterceptor(),
    );
  }

  Dio interceptor() {
    return dio;
  }

  Future<bool> isAuthenticated() async {
    // return await hasAccessToken();
    return false;
  }
}

