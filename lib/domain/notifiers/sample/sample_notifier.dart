import 'package:aufguss_event_app/common/logger.dart';
import 'package:aufguss_event_app/domain/repository/secure_storage/secure_storage_key.dart';
import 'package:aufguss_event_app/domain/repository/secure_storage/secure_storage_repository.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_key.dart';
import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'sample_state.dart';

final sampleNotifierProvider =
    StateNotifierProvider<SampleNotifier, SampleState>(
  (ref) => SampleNotifier(ref),
);

class SampleNotifier extends StateNotifier<SampleState> with LocatorMixin {
  SampleNotifier(
    this._ref,
  ) : super(const SampleState(count: 0)) {
    logger.fine('called SampleNotifier');
    init();
  }
  final Ref _ref;

  SharedPreferencesRepository get sharedPreferencesRepository =>
      _ref.read(sharedPreferencesRepositoryProvider);

  SecureStorageRepository get secureStorageRepository =>
      _ref.read(secureStorageRepositoryProvider);

  Future<void> init() async {
    final sample = await sharedPreferencesRepository.load<int?>(
      SharedPreferencesKey.sample,
    );
    if (sample == null) {
      final result = await sharedPreferencesRepository.save<int?>(
        SharedPreferencesKey.sample,
        1,
      );
      logger.fine('SharedPreferences save $result');
    }
    logger.fine('SharedPreferencesKey load $sample');

    final secureStorageSample =
        await secureStorageRepository.load(SecureStorageKey.sample);
    logger.fine('SecureStorageKey load: $secureStorageSample');
    if (secureStorageSample == null) {
      await secureStorageRepository.save(SecureStorageKey.sample, 'sample');
    }
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}
