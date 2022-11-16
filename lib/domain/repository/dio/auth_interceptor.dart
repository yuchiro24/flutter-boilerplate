import 'package:aufguss_event_app/domain/notifiers/auth_notifier.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._ref);

  final Ref _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = await _ref.watch(authTokenProvider.future);
    print(authToken);
    if (authToken != null) {
      options.headers['Authorization'] = 'JWT $authToken';
    }
    return handler.next(options);
  }
}
