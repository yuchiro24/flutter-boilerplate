import 'dart:async';
import 'dart:convert';

import 'package:aufguss_event_app/domain/entities/board/board.dart';
import 'package:aufguss_event_app/domain/entities/member/member.dart';
import 'package:aufguss_event_app/domain/entities/room_status/room_status.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:aufguss_event_app/domain/repository/web_socket/web_socket_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:web_socket_channel/io.dart';

import '../../entities/room/room.dart';

part 'room_notifier.freezed.dart';

final roomNotifierProvider = StateNotifierProvider<RoomNotifier, RoomState>(
  (ref) => RoomNotifier(ref),
);

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    @Default(null) Room? room,
    @Default(<Member>[]) List<Member> memberList,
    Board? board,
    RoomStatus? roomStatus,
    @Default(false) bool isStopNav,
    @Default(0) int timerSecond,
  }) = _RoomState;
}

class RoomNotifier extends StateNotifier<RoomState> {
  RoomNotifier(this._ref) : super(const RoomState());

  final Ref _ref;
  WebSocketRepository get webSocketRepository =>
      _ref.read(webSocketRepositoryProvider);

  IOWebSocketChannel? channel;

  Future<void> create(String name, int digits) async {
    try {
      final uri = _ref.read(appServiceProvider).endpoint('/rooms/');
      final params = {
        'title': name,
        'digits': digits,
      };
      final response = await _ref.read(appServiceProvider).post(uri, params);
      final room = Room.fromJson(response);
      state = state.copyWith(room: room);
      await _connect();
    } on Exception catch (_) {
      throw Exception('failed to create room');
    }
  }

  StreamSubscription<dynamic>? streamSubscription;
  Future<void> _connect() async {
    channel = await webSocketRepository.setChannel(state.room?.id ?? '');
    await streamSubscription?.cancel();
    streamSubscription = _listen().listen((dynamic event) {
      final map = jsonDecode(event as String) as Map<String, dynamic>;
      if (map['type'] == 'members') {
        final members = map['content']['members'] as Map;

        final memberList = members.values.map((dynamic e) {
          final member = Member.fromJson(e as Map<String, dynamic>);
          return member;
        }).toList();
        print(memberList);
        state = state.copyWith(memberList: memberList);
      }
      if (map['type'] == 'room_status') {
        final roomStatus =
            RoomStatus.fromJson(map['content'] as Map<String, dynamic>);
        print(roomStatus);
        state = state.copyWith(roomStatus: roomStatus);
      }
      if (map['type'] == 'board') {
        final board = Board.fromJson(map['content'] as Map<String, dynamic>);
        print(board);
        state = state.copyWith(board: board);
      }
      print(map);
    });
  }

  Future<void> join(int digits) async {
    try {
      final uri = _ref.read(appServiceProvider).endpoint('/rooms/join/');
      final params = {
        'digits': digits,
      };
      final response = await _ref.read(appServiceProvider).post(uri, params);

      final room = Room.fromJson(response);
      state = state.copyWith(room: room);
      await _connect();
    } on Exception catch (_) {
      throw Exception('failed to join room');
    }
  }

  Stream<dynamic> _listen() {
    return channel!.stream;
  }

  Future<void> close() async {
    await channel!.sink.close();
  }

  Future<void> _post(String value) async {
    channel!.sink.add(value);
  }

  // 準備完了
  Future<void> ready() async {
    await _post('{"type": "ready", "content": null}');
  }

  // スタート
  Future<void> start() async {
    await _post('{"type": "start", "content": null}');
  }

  // かるたをとる
  Future<void> take(int id) async {
    await _post('{"type": "take", "content": {"card_id": $id}}');
  }

  // 次に進む
  Future<void> next() async {
    await _post('{"type": "next", "content": null}');
  }

  void setIsStopNav({required bool value}) {
    state = state.copyWith(isStopNav: value);
  }

  StopWatchTimer countTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(5),
  );
  void timer(int seconds) {
    countTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(seconds),
    )..onStartTimer();
  }
}
