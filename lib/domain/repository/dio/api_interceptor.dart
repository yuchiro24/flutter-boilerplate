import 'package:aufguss_event_app/common/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// logging
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      logger
        ..info('###################################')
        ..info(
          '-->'
          '${options.method.toUpperCase()}'
          '${'${options.baseUrl}${options.path}'}',
        )
        ..info('Headers:');
      options.headers.forEach((k, dynamic v) => logger.info('$k: $v'));
      logger.info('queryParameters:');
      options.queryParameters.forEach((k, dynamic v) => logger.info('$k: $v'));
      if (options.data != null) {
        logger.info('Body: ${options.data}');
      }
      logger
        ..info('--> END ${options.method.toUpperCase()}')
        ..info('###################################');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      logger
        ..info('###################################')
        ..info('<-- '
            '${response.statusCode} '
            '${response.requestOptions.baseUrl + response.requestOptions.path}')
        ..info('Headers:');
      response.headers.forEach((k, v) => logger.info('$k: $v'));
      logger
        ..info('Response: ${response.data}')
        ..info('<-- END HTTP')
        ..info('###################################');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      logger
        ..info('###################################')
        ..info('<-- End Error')
        ..info('<-- ${err.error}')
        ..info('Error:')
        ..info('Response: ${err.response}')
        ..info('RequestPath: ${err.requestOptions.path}')
        ..info('<-- '
            '${err.message}'
            '${err.response?.requestOptions.baseUrl}'
            '${err.response?.requestOptions.path}'
            '${' Method: ${err.requestOptions.method}'}')
        ..info('${err.response != null ? err.response!.data : 'Unknown Error'}')
        ..info('<-- End Error')
        ..info('###################################');
    }

    // サーバーからエラーメッセージが送信されていた時
    if (err.response != null) {
      final dynamic data = err.response!.data;
      if (data.runtimeType != String) {
        final dynamic errors =
            (err.response!.data as Map<String, dynamic>)['errors'];
        if (errors != null) {
          err.error =
              (errors as List).map((dynamic e) => e.toString()).join(' ');
          super.onError(err, handler);
          return;
        }
        final dynamic error =
            (err.response!.data as Map<String, dynamic>)['error'];
        if (error != null) {
          err.error = error;
          super.onError(err, handler);
          return;
        }
      }
    }

    switch (err.type) {
      case DioErrorType.cancel:
        err.error = 'リクエストがキャンセルされました';
        break;
      case DioErrorType.connectTimeout:
        err.error = '通信に失敗しました。恐れ入りますが、しばらくしてから再度お試しください。';
        break;
      case DioErrorType.other:
        err.error = '通信環境に問題が発生しました。恐れ入りますが、しばらくしてから再度お試しください。';
        break;
      case DioErrorType.receiveTimeout:
        err.error = '通信に失敗しました。恐れ入りますが、しばらくしてから再度お試しください。';
        break;
      case DioErrorType.response:
        err.error = 'サーバーエラーが発生しました。恐れ入りますが、しばらくしてから再度お試しください。';
        break;
      case DioErrorType.sendTimeout:
        err.error = '予期せぬエラーが発生しました。恐れ入りますが、しばらくしてから再度お試しください。';
        break;
    }
    super.onError(err, handler);
  }
}
