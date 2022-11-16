import 'package:aufguss_event_app/domain/repository/dio/app_dio.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_key.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appServiceProvider =
    Provider<AppServiceRepository>((ref) => AppServiceRepository(ref));

class AppServiceRepository {
  AppServiceRepository(this._ref);

  final Ref _ref;

  Dio get _appDio => _ref.watch(appDioProvider);
  Dio get _appRegisterDio => _ref.watch(appRegisterDioProvider);
  SharedPreferencesRepository get sharedPreferences =>
      _ref.read(sharedPreferencesRepositoryProvider);

  static String get apiUrl => 'api';

  static const int firstPage = 1;
  static const int defaultPerPage = 20;

  // //////////////////////////////////////////////////////////
  // //MARK: - リクエストヘッダー
  // //////////////////////////////////////////////////////////
  Future<Map<String, dynamic>> get headers async {
    // final authorization =
    //     await sharedPreferences.load<String?>(SharedPreferencesKey.authToken);
    final prefs = await SharedPreferences.getInstance();
    final authorization =
        prefs.getString(SharedPreferencesKey.authToken.rawValue);
    print('authorization: $authorization');
    final headers = <String, dynamic>{};

    if (authorization?.isNotEmpty ?? false) {
      headers['Authorization'] = 'JWT $authorization';
    }
    return headers;
  }

  //////////////////////////////////////////////////////////
  //MARK: - エンドポイント
  //////////////////////////////////////////////////////////

  String endpoint(String postfix) => AppServiceRepository.apiUrl + postfix;

  dynamic commonBehavior(Response<dynamic> response) {
    // Error response
    if (response.statusCode! >= 400) {
      throw response.data as Error;
    }
    // Secure.setHttpResponseHeader(response.headers.map);
    return response.data;
  }

  Map<String, dynamic> commonMapBehavior(
      Response<Map<String, dynamic>> response) {
    if (response.data == null) {
      throwNullResponseException();
    }
    if (response.statusCode! >= 400) {
      throw response.data! as Error;
    }
    return response.data!;
  }

  Never throwNullResponseException() {
    throw Exception('Response is null.');
  }

  // Future<dynamic> _retry(RequestOptions requestOptions) async {
  //   // final header = await headers;
  //   return _dio.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: Options(
  //       method: requestOptions.method,
  //       // headers: header,
  //     ),
  //   );
  // }

  Future<Map<String, dynamic>> get(
    String uri,
    Map<String, dynamic> params,
  ) async {
    final header = await headers;
    final response = await _appDio.get<Map<String, dynamic>>(
      uri,
      queryParameters: params,
      options: Options(headers: header),
    );
    return commonMapBehavior(response);
  }

  Future<dynamic> getDynamic(String uri, Map<String, dynamic> params) async {
    final response = await _appDio.get<dynamic>(uri, queryParameters: params);
    return commonBehavior(response);
  }

  // dataがnullの場合はパラメータの情報をpost
  // 分かりづらいので呼び出し側でdataにパラメータの情報を付与する形でも良いかも

  Future<Map<String, dynamic>> post(
    String uri,
    Map<String, dynamic> params, {
    Map<String, dynamic>? data,
  }) async {
    final header = await headers;
    final response = await _appDio.post<Map<String, dynamic>>(
      uri,
      queryParameters: params,
      data: data ?? params,
      options: Options(headers: header),
    );
    return commonMapBehavior(response);
  }

  Future<Map<String, dynamic>> register(
    String uri,
    Map<String, dynamic> params, {
    Map<String, dynamic>? data,
  }) async {
    final response = await _appRegisterDio.post<Map<String, dynamic>>(
      uri,
      queryParameters: params,
      data: data,
    );
    return commonMapBehavior(response);
  }

  Future<void> postVoid(
    String uri,
    Map<String, dynamic> params, {
    Map<String, dynamic>? data,
  }) async {
    await _appDio.post<void>(uri,
        queryParameters: params, data: data ?? params);
  }

  Future<dynamic> put(String uri, Map<String, dynamic> data) async {
    final header = await headers;
    final response = await _appDio.put<dynamic>(
      uri,
      data: data,
      options: Options(headers: header),
    );
    return commonBehavior(response);
  }

  Future<dynamic> patch(String uri, Map<String, dynamic> params) async {
    final response = await _appDio.patch<dynamic>(uri,
        queryParameters: params, data: params);
    return commonBehavior(response);
  }

  Future<Map<String, dynamic>> delete(
    String uri,
    Map<String, dynamic> params, {
    Map<String, dynamic>? body,
  }) async {
    final response = await _appDio.delete<Map<String, dynamic>>(
      uri,
      queryParameters: params,
      data: body,
    );
    return commonMapBehavior(response);
  }

  Future<void> deleteVoid(
    String uri,
    Map<String, dynamic> params, {
    Map<String, dynamic>? body,
  }) async {
    await _appDio.delete<void>(
      uri,
      queryParameters: params,
      data: body,
    );
  }

  Future<dynamic> download(
      String url, String savePath, ProgressCallback onProgress) async {
    await _appDio.download(url, savePath, onReceiveProgress: onProgress);
  }

  Future<String> refreshToken({required String by}) async {
    final uri = endpoint('/auth/refresh/');
    final response = await _appDio.post<Map<String, dynamic>>(
      uri,
      data: <String, String>{'token': by},
    ).onError((error, stackTrace) async {
      throw Exception(error);
    });

    // final refreshedToken = AuthToken.fromJson(commonMapBehavior(response));
    // return refreshedToken.token;
    return '';
  }
}
