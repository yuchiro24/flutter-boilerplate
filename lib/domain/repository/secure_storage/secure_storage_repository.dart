import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'secure_storage_key.dart';

final secureStorageRepositoryProvider = Provider<SecureStorageRepository>((_) {
  return SecureStorageRepository();
});

class SecureStorageRepository {
  Future<String?> load(SecureStorageKey key) {
    try {
      const storage = FlutterSecureStorage();
      return storage.read(key: key.rawValue);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> save(SecureStorageKey key, String? value) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: key.rawValue, value: value);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
