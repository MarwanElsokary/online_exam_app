import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../Locale/PrefsHelper.dart';

@module
abstract class NetworkModule {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ));
    await PrefsHelper.init();

    String token = PrefsHelper.getToken() ?? "";

    dio.options.headers["token"] = token;

    dio.interceptors.add(prettyDioLogger());
    return dio;
  }
}

@lazySingleton
PrettyDioLogger prettyDioLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    compact: false,
  );
}
