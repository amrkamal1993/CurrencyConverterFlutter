import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api_path.dart';
import 'interceptors/server_exception_interceptor.dart';

abstract class IDioClient {
  Dio getClient();
}

class DioClient implements IDioClient {
  final String baseUrl = ApiConstants.baseApiUrl;
  //AnonymousDioClient({required this.baseUrl});

  @override
  Dio getClient() {
    final Dio dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        sendTimeout: const Duration(seconds: 60).inMilliseconds,
        receiveTimeout: const Duration(seconds: 60).inMilliseconds,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
        baseUrl: baseUrl));

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

    dio.interceptors.add(ServerExceptionInterceptor());
    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
    return dio;
  }
}
