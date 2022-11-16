import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TokenRefreshInterceptor extends Interceptor {
  TokenRefreshInterceptor(this._ref, this._dio);

  final Ref _ref;
  final Dio _dio;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 && err.response?.statusCode != 403) {
      handler.next(err);
      return;
    }
    try {
      // await _ref.read(authNotifierProvider).refreshAuthToken();
    } on Exception catch (_) {
      handler.next(
        DioError(
          requestOptions: err.requestOptions,
          response: err.response,
          type: DioErrorType.other,
          error: Exception('Auth token refresh failed'),
        ),
      );
      return;
    }
    handler.resolve(await _retry(err.requestOptions));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
