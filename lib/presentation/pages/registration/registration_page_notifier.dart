import 'package:aufguss_event_app/domain/notifiers/auth_notifier.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:aufguss_event_app/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'registration_page_notifier.freezed.dart';

final registrationPageNotifierProvider = StateNotifierProvider.autoDispose<
    RegistrationPageNotifier, RegistrationPageState>(
  (ref) => RegistrationPageNotifier(ref),
);

enum RegistrationStatus {
  invalid,
  loading,
  success,
}

@freezed
class RegistrationPageState with _$RegistrationPageState {
  const factory RegistrationPageState({
    @Default(RegistrationStatus.invalid) RegistrationStatus registerState,
    @Default('') String nickname,
  }) = _RegistrationPageState;
}

class RegistrationPageNotifier extends StateNotifier<RegistrationPageState>
    with LocatorMixin {
  RegistrationPageNotifier(this._ref) : super(const RegistrationPageState());
  final Ref _ref;

  AppServiceRepository get repository => _ref.read(appServiceProvider);

  void setNickname(String text) {
    if (text.isEmpty) {
      state = state.copyWith(
        registerState: RegistrationStatus.invalid,
        nickname: text,
      );
    } else {
      state = state.copyWith(
        registerState: RegistrationStatus.success,
        nickname: text,
      );
    }
  }

  Future<void> register(BuildContext context) async {
    state = state.copyWith(registerState: RegistrationStatus.loading);
    try {
      await _ref.read(authNotifierProvider).register(state.nickname);
      state = state.copyWith(registerState: RegistrationStatus.success);
      await Navigator.of(context).push<void>(
        CupertinoPageRoute(builder: (_) => const HomePage()),
      );
    } on Exception catch (_) {
      state = state.copyWith(registerState: RegistrationStatus.invalid);
    }
  }
}
