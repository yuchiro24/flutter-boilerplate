// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomState {
  Room? get room => throw _privateConstructorUsedError;
  List<Member> get memberList => throw _privateConstructorUsedError;
  Board? get board => throw _privateConstructorUsedError;
  RoomStatus? get roomStatus => throw _privateConstructorUsedError;
  bool get isStopNav => throw _privateConstructorUsedError;
  int get timerSecond => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res, RoomState>;
  @useResult
  $Res call(
      {Room? room,
      List<Member> memberList,
      Board? board,
      RoomStatus? roomStatus,
      bool isStopNav,
      int timerSecond});

  $RoomCopyWith<$Res>? get room;
  $BoardCopyWith<$Res>? get board;
  $RoomStatusCopyWith<$Res>? get roomStatus;
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res, $Val extends RoomState>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = freezed,
    Object? memberList = null,
    Object? board = freezed,
    Object? roomStatus = freezed,
    Object? isStopNav = null,
    Object? timerSecond = null,
  }) {
    return _then(_value.copyWith(
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room?,
      memberList: null == memberList
          ? _value.memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board?,
      roomStatus: freezed == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as RoomStatus?,
      isStopNav: null == isStopNav
          ? _value.isStopNav
          : isStopNav // ignore: cast_nullable_to_non_nullable
              as bool,
      timerSecond: null == timerSecond
          ? _value.timerSecond
          : timerSecond // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res>? get board {
    if (_value.board == null) {
      return null;
    }

    return $BoardCopyWith<$Res>(_value.board!, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomStatusCopyWith<$Res>? get roomStatus {
    if (_value.roomStatus == null) {
      return null;
    }

    return $RoomStatusCopyWith<$Res>(_value.roomStatus!, (value) {
      return _then(_value.copyWith(roomStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoomStateCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$$_RoomStateCopyWith(
          _$_RoomState value, $Res Function(_$_RoomState) then) =
      __$$_RoomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Room? room,
      List<Member> memberList,
      Board? board,
      RoomStatus? roomStatus,
      bool isStopNav,
      int timerSecond});

  @override
  $RoomCopyWith<$Res>? get room;
  @override
  $BoardCopyWith<$Res>? get board;
  @override
  $RoomStatusCopyWith<$Res>? get roomStatus;
}

/// @nodoc
class __$$_RoomStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$_RoomState>
    implements _$$_RoomStateCopyWith<$Res> {
  __$$_RoomStateCopyWithImpl(
      _$_RoomState _value, $Res Function(_$_RoomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = freezed,
    Object? memberList = null,
    Object? board = freezed,
    Object? roomStatus = freezed,
    Object? isStopNav = null,
    Object? timerSecond = null,
  }) {
    return _then(_$_RoomState(
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room?,
      memberList: null == memberList
          ? _value._memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board?,
      roomStatus: freezed == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as RoomStatus?,
      isStopNav: null == isStopNav
          ? _value.isStopNav
          : isStopNav // ignore: cast_nullable_to_non_nullable
              as bool,
      timerSecond: null == timerSecond
          ? _value.timerSecond
          : timerSecond // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RoomState implements _RoomState {
  const _$_RoomState(
      {this.room = null,
      final List<Member> memberList = const <Member>[],
      this.board,
      this.roomStatus,
      this.isStopNav = false,
      this.timerSecond = 0})
      : _memberList = memberList;

  @override
  @JsonKey()
  final Room? room;
  final List<Member> _memberList;
  @override
  @JsonKey()
  List<Member> get memberList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberList);
  }

  @override
  final Board? board;
  @override
  final RoomStatus? roomStatus;
  @override
  @JsonKey()
  final bool isStopNav;
  @override
  @JsonKey()
  final int timerSecond;

  @override
  String toString() {
    return 'RoomState(room: $room, memberList: $memberList, board: $board, roomStatus: $roomStatus, isStopNav: $isStopNav, timerSecond: $timerSecond)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomState &&
            (identical(other.room, room) || other.room == room) &&
            const DeepCollectionEquality()
                .equals(other._memberList, _memberList) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.roomStatus, roomStatus) ||
                other.roomStatus == roomStatus) &&
            (identical(other.isStopNav, isStopNav) ||
                other.isStopNav == isStopNav) &&
            (identical(other.timerSecond, timerSecond) ||
                other.timerSecond == timerSecond));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      room,
      const DeepCollectionEquality().hash(_memberList),
      board,
      roomStatus,
      isStopNav,
      timerSecond);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomStateCopyWith<_$_RoomState> get copyWith =>
      __$$_RoomStateCopyWithImpl<_$_RoomState>(this, _$identity);
}

abstract class _RoomState implements RoomState {
  const factory _RoomState(
      {final Room? room,
      final List<Member> memberList,
      final Board? board,
      final RoomStatus? roomStatus,
      final bool isStopNav,
      final int timerSecond}) = _$_RoomState;

  @override
  Room? get room;
  @override
  List<Member> get memberList;
  @override
  Board? get board;
  @override
  RoomStatus? get roomStatus;
  @override
  bool get isStopNav;
  @override
  int get timerSecond;
  @override
  @JsonKey(ignore: true)
  _$$_RoomStateCopyWith<_$_RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
