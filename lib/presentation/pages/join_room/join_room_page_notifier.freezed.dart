// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'join_room_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JoinRoomPageState {
  String get roomId => throw _privateConstructorUsedError;
  JoinStatus get joinStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JoinRoomPageStateCopyWith<JoinRoomPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRoomPageStateCopyWith<$Res> {
  factory $JoinRoomPageStateCopyWith(
          JoinRoomPageState value, $Res Function(JoinRoomPageState) then) =
      _$JoinRoomPageStateCopyWithImpl<$Res, JoinRoomPageState>;
  @useResult
  $Res call({String roomId, JoinStatus joinStatus});
}

/// @nodoc
class _$JoinRoomPageStateCopyWithImpl<$Res, $Val extends JoinRoomPageState>
    implements $JoinRoomPageStateCopyWith<$Res> {
  _$JoinRoomPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? joinStatus = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      joinStatus: null == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as JoinStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JoinRoomPageStateCopyWith<$Res>
    implements $JoinRoomPageStateCopyWith<$Res> {
  factory _$$_JoinRoomPageStateCopyWith(_$_JoinRoomPageState value,
          $Res Function(_$_JoinRoomPageState) then) =
      __$$_JoinRoomPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, JoinStatus joinStatus});
}

/// @nodoc
class __$$_JoinRoomPageStateCopyWithImpl<$Res>
    extends _$JoinRoomPageStateCopyWithImpl<$Res, _$_JoinRoomPageState>
    implements _$$_JoinRoomPageStateCopyWith<$Res> {
  __$$_JoinRoomPageStateCopyWithImpl(
      _$_JoinRoomPageState _value, $Res Function(_$_JoinRoomPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? joinStatus = null,
  }) {
    return _then(_$_JoinRoomPageState(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      joinStatus: null == joinStatus
          ? _value.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as JoinStatus,
    ));
  }
}

/// @nodoc

class _$_JoinRoomPageState implements _JoinRoomPageState {
  const _$_JoinRoomPageState(
      {this.roomId = '', this.joinStatus = JoinStatus.invalid});

  @override
  @JsonKey()
  final String roomId;
  @override
  @JsonKey()
  final JoinStatus joinStatus;

  @override
  String toString() {
    return 'JoinRoomPageState(roomId: $roomId, joinStatus: $joinStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinRoomPageState &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, joinStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinRoomPageStateCopyWith<_$_JoinRoomPageState> get copyWith =>
      __$$_JoinRoomPageStateCopyWithImpl<_$_JoinRoomPageState>(
          this, _$identity);
}

abstract class _JoinRoomPageState implements JoinRoomPageState {
  const factory _JoinRoomPageState(
      {final String roomId,
      final JoinStatus joinStatus}) = _$_JoinRoomPageState;

  @override
  String get roomId;
  @override
  JoinStatus get joinStatus;
  @override
  @JsonKey(ignore: true)
  _$$_JoinRoomPageStateCopyWith<_$_JoinRoomPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
