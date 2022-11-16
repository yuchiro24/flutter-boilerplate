// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registration_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegistrationPageState {
  RegistrationStatus get registerState => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationPageStateCopyWith<RegistrationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationPageStateCopyWith<$Res> {
  factory $RegistrationPageStateCopyWith(RegistrationPageState value,
          $Res Function(RegistrationPageState) then) =
      _$RegistrationPageStateCopyWithImpl<$Res, RegistrationPageState>;
  @useResult
  $Res call({RegistrationStatus registerState, String nickname});
}

/// @nodoc
class _$RegistrationPageStateCopyWithImpl<$Res,
        $Val extends RegistrationPageState>
    implements $RegistrationPageStateCopyWith<$Res> {
  _$RegistrationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerState = null,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      registerState: null == registerState
          ? _value.registerState
          : registerState // ignore: cast_nullable_to_non_nullable
              as RegistrationStatus,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegistrationPageStateCopyWith<$Res>
    implements $RegistrationPageStateCopyWith<$Res> {
  factory _$$_RegistrationPageStateCopyWith(_$_RegistrationPageState value,
          $Res Function(_$_RegistrationPageState) then) =
      __$$_RegistrationPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RegistrationStatus registerState, String nickname});
}

/// @nodoc
class __$$_RegistrationPageStateCopyWithImpl<$Res>
    extends _$RegistrationPageStateCopyWithImpl<$Res, _$_RegistrationPageState>
    implements _$$_RegistrationPageStateCopyWith<$Res> {
  __$$_RegistrationPageStateCopyWithImpl(_$_RegistrationPageState _value,
      $Res Function(_$_RegistrationPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerState = null,
    Object? nickname = null,
  }) {
    return _then(_$_RegistrationPageState(
      registerState: null == registerState
          ? _value.registerState
          : registerState // ignore: cast_nullable_to_non_nullable
              as RegistrationStatus,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationPageState implements _RegistrationPageState {
  const _$_RegistrationPageState(
      {this.registerState = RegistrationStatus.invalid, this.nickname = ''});

  @override
  @JsonKey()
  final RegistrationStatus registerState;
  @override
  @JsonKey()
  final String nickname;

  @override
  String toString() {
    return 'RegistrationPageState(registerState: $registerState, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationPageState &&
            (identical(other.registerState, registerState) ||
                other.registerState == registerState) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerState, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationPageStateCopyWith<_$_RegistrationPageState> get copyWith =>
      __$$_RegistrationPageStateCopyWithImpl<_$_RegistrationPageState>(
          this, _$identity);
}

abstract class _RegistrationPageState implements RegistrationPageState {
  const factory _RegistrationPageState(
      {final RegistrationStatus registerState,
      final String nickname}) = _$_RegistrationPageState;

  @override
  RegistrationStatus get registerState;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationPageStateCopyWith<_$_RegistrationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
