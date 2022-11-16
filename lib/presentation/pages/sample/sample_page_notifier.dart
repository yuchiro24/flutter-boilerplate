import 'package:aufguss_event_app/common/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'sample_page_notifier.freezed.dart';

final samplePageNotifierProvider =
    StateNotifierProvider.autoDispose<SamplePageNotifier, SamplePageState>(
        (ref) {
  final samplePageNotifier = SamplePageNotifier(ref);
  return samplePageNotifier;
});

@freezed
abstract class SamplePageState with _$SamplePageState {
  const factory SamplePageState({
    @Default(0) int selectedIndex,
  }) = _SamplePageState;
}

class SamplePageNotifier extends StateNotifier<SamplePageState>
    with LocatorMixin {
  SamplePageNotifier(
    this._ref,
  ) : super(
          const SamplePageState(selectedIndex: 0),
        ) {
    Future<void>.delayed(Duration.zero, _configure);
  }
  final Ref _ref;

  void _configure() {
    logger.fine('called SamplePageNotifier');
  }

  void increment() {
    state = state.copyWith(selectedIndex: state.selectedIndex + 1);
  }
}
