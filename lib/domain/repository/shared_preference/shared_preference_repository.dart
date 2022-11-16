import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preference_key.dart';

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>((_) {
  return SharedPreferencesRepository();
});

class SharedPreferencesRepository {
  Future<T> load<T>(SharedPreferencesKey key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (T.toString() == 'int' || T.toString() == 'int?') {
        return prefs.getInt(key.rawValue) as T;
      }
      if (T.toString() == 'double' || T.toString() == 'double?') {
        return prefs.getDouble(key.rawValue) as T;
      }
      if (T.toString() == 'bool' || T.toString() == 'bool?') {
        return prefs.getBool(key.rawValue) as T;
      }
      if (T.toString() == 'String' || T.toString() == 'String?') {
        return prefs.getString(key.rawValue) as T;
      }
      if (T.toString() == 'List<String>' || T.toString() == 'List<String?>') {
        return prefs.getStringList(key.rawValue) as T;
      }
      return null as T;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<bool> save<T>(SharedPreferencesKey key, T value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (T.toString() == 'int' || T.toString() == 'int?') {
        return prefs.setInt(key.rawValue, value as int);
      }
      if (T.toString() == 'double' || T.toString() == 'double?') {
        return prefs.setDouble(key.rawValue, value as double);
      }
      if (T.toString() == 'bool' || T.toString() == 'bool?') {
        return prefs.setBool(key.rawValue, value as bool);
      }
      if (T.toString() == 'String' || T.toString() == 'String?') {
        return prefs.setString(key.rawValue, value as String);
      }
      if (T.toString() == 'List<String>' || T.toString() == 'List<String?>') {
        return prefs.setStringList(key.rawValue, value as List<String>);
      }
      return false;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
