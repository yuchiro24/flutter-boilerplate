import 'dart:async';

import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/domain/repository/web_socket/web_socket_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';

part 'create_room_page_notifier.freezed.dart';

final createRoomPageNotifierProvider =
    StateNotifierProvider<CreateRoomPageNotifier, CreateRoomPageState>(
  (ref) => CreateRoomPageNotifier(ref),
);

enum CreateRoomStatus {
  invalid,
  canStart,
  loading,
  success,
}

@freezed
class CreateRoomPageState with _$CreateRoomPageState {
  const factory CreateRoomPageState({
    @Default('') String roomId,
    @Default(CreateRoomStatus.invalid) CreateRoomStatus roomStatus,
  }) = _CreateRoomPageState;
}

class CreateRoomPageNotifier extends StateNotifier<CreateRoomPageState>
    with LocatorMixin {
  CreateRoomPageNotifier(this._ref) : super(const CreateRoomPageState());

  final Ref _ref;

  WebSocketRepository get webSocketRepository =>
      _ref.read(webSocketRepositoryProvider);

  Future<void> setRoomId(String text) async {
    state = state.copyWith(roomId: text);
    if (state.roomId.length == 6) {
      state = state.copyWith(roomStatus: CreateRoomStatus.canStart);
      try {
        await _createRoom();
      } on Exception catch (_) {
        state = state.copyWith(roomStatus: CreateRoomStatus.invalid);
      }
      state = state.copyWith(roomStatus: CreateRoomStatus.success);
    } else {
      state = state.copyWith(roomStatus: CreateRoomStatus.invalid);
    }
  }

  Future<void> _createRoom() async {
    await _ref.read(roomNotifierProvider.notifier).create(
          _roomName(),
          int.parse(state.roomId),
        );
    logger.info(_ref.read(roomNotifierProvider).room);
  }

  String _roomName() {
    final now = DateTime.now();
    final outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(now);
  }
}
