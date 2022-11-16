import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/notifiers/auth_notifier.dart';
import 'package:aufguss_event_app/presentation/pages/home/home_page.dart';
import 'package:aufguss_event_app/presentation/pages/registration/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'top_page_notifier.freezed.dart';

final topPageNotifierProvider =
    StateNotifierProvider.autoDispose<TopPageNotifier, TopPageState>(
  (ref) => TopPageNotifier(ref),
);

@freezed
class TopPageState with _$TopPageState {
  const factory TopPageState({
    @Default(false) bool isLoading,
  }) = _TopPageState;
}

class TopPageNotifier extends StateNotifier<TopPageState> with LocatorMixin {
  TopPageNotifier(this._ref) : super(const TopPageState());
  final Ref _ref;

  Future<void> init(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await _ref.read(authNotifierProvider).auth();
      state = state.copyWith(isLoading: false);
      await Navigator.of(context, rootNavigator: true)
          .pushReplacement<CupertinoPageRoute<void>, void>(
        CupertinoPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } on Exception catch (_) {
      logger.info('auth failed');
      state = state.copyWith(isLoading: false);
      await Navigator.of(context, rootNavigator: true)
          .pushReplacement<CupertinoPageRoute<void>, void>(
        CupertinoPageRoute(
          builder: (_) => const RegistrationPage(),
        ),
      );
      rethrow;
    }
  }
}
