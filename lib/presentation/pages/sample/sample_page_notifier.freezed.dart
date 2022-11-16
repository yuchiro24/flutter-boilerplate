// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sample_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SamplePageState {
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SamplePageStateCopyWith<SamplePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SamplePageStateCopyWith<$Res> {
  factory $SamplePageStateCopyWith(
          SamplePageState value, $Res Function(SamplePageState) then) =
      _$SamplePageStateCopyWithImpl<$Res, SamplePageState>;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$SamplePageStateCopyWithImpl<$Res, $Val extends SamplePageState>
    implements $SamplePageStateCopyWith<$Res> {
  _$SamplePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SamplePageStateCopyWith<$Res>
    implements $SamplePageStateCopyWith<$Res> {
  factory _$$_SamplePageStateCopyWith(
          _$_SamplePageState value, $Res Function(_$_SamplePageState) then) =
      __$$_SamplePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$$_SamplePageStateCopyWithImpl<$Res>
    extends _$SamplePageStateCopyWithImpl<$Res, _$_SamplePageState>
    implements _$$_SamplePageStateCopyWith<$Res> {
  __$$_SamplePageStateCopyWithImpl(
      _$_SamplePageState _value, $Res Function(_$_SamplePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_$_SamplePageState(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SamplePageState implements _SamplePageState {
  const _$_SamplePageState({this.selectedIndex = 0});

  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'SamplePageState(selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SamplePageState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SamplePageStateCopyWith<_$_SamplePageState> get copyWith =>
      __$$_SamplePageStateCopyWithImpl<_$_SamplePageState>(this, _$identity);
}

abstract class _SamplePageState implements SamplePageState {
  const factory _SamplePageState({final int selectedIndex}) =
      _$_SamplePageState;

  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_SamplePageStateCopyWith<_$_SamplePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
