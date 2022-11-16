import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'join_room_page_notifier.freezed.dart';

final joinRoomPageNotifierProvider =
    StateNotifierProvider.autoDispose<JoinRoomPageNotifier, JoinRoomPageState>(
  (ref) => JoinRoomPageNotifier(ref),
);

enum JoinStatus {
  invalid,
  canTry,
  loading,
  success,
}

@freezed
class JoinRoomPageState with _$JoinRoomPageState {
  const factory JoinRoomPageState({
    @Default('') String roomId,
    @Default(JoinStatus.invalid) JoinStatus joinStatus,
  }) = _JoinRoomPageState;
}

class JoinRoomPageNotifier extends StateNotifier<JoinRoomPageState>
    with LocatorMixin {
  JoinRoomPageNotifier(this._ref) : super(const JoinRoomPageState());

  final Ref _ref;
  AppServiceRepository get repository => _ref.read(appServiceProvider);

  void setRoomId(String text) {
    state = state.copyWith(roomId: text);
    if (state.roomId.length == 6) {
      state = state.copyWith(joinStatus: JoinStatus.canTry);
    } else {
      state = state.copyWith(joinStatus: JoinStatus.invalid);
    }
  }

  Future<void> join() async {
    if (state.joinStatus == JoinStatus.invalid) {
      return;
    }
    try {
      final digit = int.parse(
        state.roomId,
        onError: (source) => throw Exception('invalid input $source'),
      );
      await _ref.read(roomNotifierProvider.notifier).join(digit);
    } on Exception catch (_) {
      state = state.copyWith(joinStatus: JoinStatus.invalid);
    }
  }
}
