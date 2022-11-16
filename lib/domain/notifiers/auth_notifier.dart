import 'package:aufguss_event_app/common/configure/logger.dart';
import 'package:aufguss_event_app/domain/entities/auth_token/auth_token.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:aufguss_event_app/domain/repository/secure_storage/secure_storage_key.dart';
import 'package:aufguss_event_app/domain/repository/secure_storage/secure_storage_repository.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_key.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final authTokenProvider = FutureProvider<String?>(
  (ref) => ref
      .read(secureStorageRepositoryProvider)
      .load(SecureStorageKey.authToken),
);

final authNotifierProvider = Provider<AuthNotifier>((ref) => AuthNotifier(ref));

class AuthNotifier {
  AuthNotifier(this._ref) : super();

  final Ref _ref;
  AppServiceRepository get repository => _ref.read(appServiceProvider);
  SharedPreferencesRepository get sharedPreferences =>
      _ref.read(sharedPreferencesRepositoryProvider);

  Future<void> refreshAuthToken() async {
    final localDataSource = _ref.read(secureStorageRepositoryProvider);
    final authToken = await localDataSource.load(SecureStorageKey.authToken);
    if (authToken == null) {
      throw Exception('Auth token does not exist');
    }
    final token =
        await _ref.read(appServiceProvider).refreshToken(by: authToken);
    await _setAuthToken(token);
  }

  Future<void> register(String nickname) async {
    final uri = repository.endpoint('/register/uuid/');
    const uuid = Uuid();
    final uuidV1 = uuid.v1();
    final param = <String, String>{'uuid': uuidV1};
    final response = await repository
        .register(
          uri,
          <String, dynamic>{},
          data: param,
        )
        .onError((error, _) => throw Exception(error));
    final authToken = AuthToken.fromJson(response);
    await _setAuthToken(authToken.token)
        .onError((error, stackTrace) => throw Exception(error));

    final setNicknameUri = _ref.read(appServiceProvider).endpoint('/user/');
    final params = {'name': nickname};
    // set nickname
    await _ref.read(appServiceProvider).put(setNicknameUri, params);
    await _setUuid(uuidV1)
        .onError((error, stackTrace) => throw Exception(error));
    await _setNickname(nickname)
        .onError((error, stackTrace) => throw Exception(error));
  }

  Future<void> auth() async {
    final uuid =
        await sharedPreferences.load<String?>(SharedPreferencesKey.uuid);
    if (uuid == null) {
      throw Exception('no uuid');
    }
    final param = <String, dynamic>{'uuid': uuid};

    final uri = repository.endpoint('/auth/uuid/');
    final response = await repository
        .post(uri, <String, dynamic>{}, data: param)
        .onError((error, stackTrace) {
      throw Exception(error);
    });
    final authToken = AuthToken.fromJson(response);
    await _setAuthToken(authToken.token)
        .onError((error, _) => throw Exception(error));
  }

  Future<void> _setAuthToken(String? token) async {
    final result = await sharedPreferences.save<String?>(
      SharedPreferencesKey.authToken,
      token,
    );

    logger.info('token set to $result $token');
    _ref.refresh(authTokenProvider);
  }

  Future<void> _setUuid(String uuid) async {
    await sharedPreferences.save<String?>(SharedPreferencesKey.uuid, uuid);
    logger.info('uuid set to $uuid');
  }

  Future<void> _setNickname(String nickname) async {
    await sharedPreferences.save<String?>(
        SharedPreferencesKey.nickname, nickname);
    logger.info('nickname set to $nickname');
  }
}
