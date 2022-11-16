// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_room_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateRoomPageState {
  String get roomId => throw _privateConstructorUsedError;
  CreateRoomStatus get roomStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateRoomPageStateCopyWith<CreateRoomPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomPageStateCopyWith<$Res> {
  factory $CreateRoomPageStateCopyWith(
          CreateRoomPageState value, $Res Function(CreateRoomPageState) then) =
      _$CreateRoomPageStateCopyWithImpl<$Res, CreateRoomPageState>;
  @useResult
  $Res call({String roomId, CreateRoomStatus roomStatus});
}

/// @nodoc
class _$CreateRoomPageStateCopyWithImpl<$Res, $Val extends CreateRoomPageState>
    implements $CreateRoomPageStateCopyWith<$Res> {
  _$CreateRoomPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomStatus = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as CreateRoomStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateRoomPageStateCopyWith<$Res>
    implements $CreateRoomPageStateCopyWith<$Res> {
  factory _$$_CreateRoomPageStateCopyWith(_$_CreateRoomPageState value,
          $Res Function(_$_CreateRoomPageState) then) =
      __$$_CreateRoomPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, CreateRoomStatus roomStatus});
}

/// @nodoc
class __$$_CreateRoomPageStateCopyWithImpl<$Res>
    extends _$CreateRoomPageStateCopyWithImpl<$Res, _$_CreateRoomPageState>
    implements _$$_CreateRoomPageStateCopyWith<$Res> {
  __$$_CreateRoomPageStateCopyWithImpl(_$_CreateRoomPageState _value,
      $Res Function(_$_CreateRoomPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomStatus = null,
  }) {
    return _then(_$_CreateRoomPageState(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as CreateRoomStatus,
    ));
  }
}

/// @nodoc

class _$_CreateRoomPageState implements _CreateRoomPageState {
  const _$_CreateRoomPageState(
      {this.roomId = '', this.roomStatus = CreateRoomStatus.invalid});

  @override
  @JsonKey()
  final String roomId;
  @override
  @JsonKey()
  final CreateRoomStatus roomStatus;

  @override
  String toString() {
    return 'CreateRoomPageState(roomId: $roomId, roomStatus: $roomStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRoomPageState &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.roomStatus, roomStatus) ||
                other.roomStatus == roomStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, roomStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateRoomPageStateCopyWith<_$_CreateRoomPageState> get copyWith =>
      __$$_CreateRoomPageStateCopyWithImpl<_$_CreateRoomPageState>(
          this, _$identity);
}

abstract class _CreateRoomPageState implements CreateRoomPageState {
  const factory _CreateRoomPageState(
      {final String roomId,
      final CreateRoomStatus roomStatus}) = _$_CreateRoomPageState;

  @override
  String get roomId;
  @override
  CreateRoomStatus get roomStatus;
  @override
  @JsonKey(ignore: true)
  _$$_CreateRoomPageStateCopyWith<_$_CreateRoomPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
