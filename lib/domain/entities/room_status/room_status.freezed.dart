// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomStatus _$RoomStatusFromJson(Map<String, dynamic> json) {
  return _RoomStatus.fromJson(json);
}

/// @nodoc
mixin _$RoomStatus {
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomStatusCopyWith<RoomStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStatusCopyWith<$Res> {
  factory $RoomStatusCopyWith(
          RoomStatus value, $Res Function(RoomStatus) then) =
      _$RoomStatusCopyWithImpl<$Res, RoomStatus>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$RoomStatusCopyWithImpl<$Res, $Val extends RoomStatus>
    implements $RoomStatusCopyWith<$Res> {
  _$RoomStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomStatusCopyWith<$Res>
    implements $RoomStatusCopyWith<$Res> {
  factory _$$_RoomStatusCopyWith(
          _$_RoomStatus value, $Res Function(_$_RoomStatus) then) =
      __$$_RoomStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$_RoomStatusCopyWithImpl<$Res>
    extends _$RoomStatusCopyWithImpl<$Res, _$_RoomStatus>
    implements _$$_RoomStatusCopyWith<$Res> {
  __$$_RoomStatusCopyWithImpl(
      _$_RoomStatus _value, $Res Function(_$_RoomStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_RoomStatus(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomStatus extends _RoomStatus {
  _$_RoomStatus({this.status = ''}) : super._();

  factory _$_RoomStatus.fromJson(Map<String, dynamic> json) =>
      _$$_RoomStatusFromJson(json);

  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'RoomStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomStatusCopyWith<_$_RoomStatus> get copyWith =>
      __$$_RoomStatusCopyWithImpl<_$_RoomStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomStatusToJson(
      this,
    );
  }
}

abstract class _RoomStatus extends RoomStatus {
  factory _RoomStatus({final String status}) = _$_RoomStatus;
  _RoomStatus._() : super._();

  factory _RoomStatus.fromJson(Map<String, dynamic> json) =
      _$_RoomStatus.fromJson;

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_RoomStatusCopyWith<_$_RoomStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
