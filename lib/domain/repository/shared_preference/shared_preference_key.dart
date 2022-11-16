enum SharedPreferencesKey {
  sample,
  authToken,
  uuid,
  nickname,
}

const _sample = 'sample';

extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  String get rawValue {
    switch (this) {
      case SharedPreferencesKey.sample:
        return _sample;
      case SharedPreferencesKey.authToken:
        return 'authToken';
      case SharedPreferencesKey.uuid:
        return 'uuid';
      case SharedPreferencesKey.nickname:
        return 'nickname';
    }
  }
}
