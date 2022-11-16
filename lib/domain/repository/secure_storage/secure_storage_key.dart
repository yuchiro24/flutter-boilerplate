enum SecureStorageKey {
  sample,
  authToken,
  uuid,
  nickname,
}

const _sample = 'sample';

extension SecureStorageKeyExtension on SecureStorageKey {
  String get rawValue {
    switch (this) {
      case SecureStorageKey.sample:
        return _sample;
      case SecureStorageKey.authToken:
        return 'authToken';
      case SecureStorageKey.uuid:
        return 'uuid';
      case SecureStorageKey.nickname:
        return 'nickname';
    }
  }
}
