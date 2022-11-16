import 'package:aufguss_event_app/domain/repository/dio/api_interceptor.dart';
import 'package:aufguss_event_app/domain/repository/dio/auth_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appDioProvider = Provider<AppDio>((ref) => AppDio(ref));

class AppDio with DioMixin implements Dio {
  AppDio(this._ref) {
    options = BaseOptions(baseUrl: baseUrl);
    interceptors.addAll([
      ApiInterceptor(),
      AuthInterceptor(_ref),
      // TokenRefreshIntreceptor(_ref, this),
    ]);
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  final Ref _ref;

  static String get baseUrl =>
      FlavorConfig.instance.variables['baseUrl'] as String;
}

final appRegisterDioProvider =
    Provider<AppRegisterDio>((ref) => AppRegisterDio(ref));

class AppRegisterDio with DioMixin implements Dio {
  AppRegisterDio(this._ref) {
    options = BaseOptions(baseUrl: baseUrl);
    interceptors.addAll([
      ApiInterceptor(),
      //AuthInterceptor(_ref),
      // TokenRefreshIntreceptor(_ref, this),
    ]);
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  final Ref _ref;

  static String get baseUrl =>
      FlavorConfig.instance.variables['baseUrl'] as String;
}
