// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppPageState {
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppPageStateCopyWith<AppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPageStateCopyWith<$Res> {
  factory $AppPageStateCopyWith(
          AppPageState value, $Res Function(AppPageState) then) =
      _$AppPageStateCopyWithImpl<$Res, AppPageState>;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$AppPageStateCopyWithImpl<$Res, $Val extends AppPageState>
    implements $AppPageStateCopyWith<$Res> {
  _$AppPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_AppPageStateCopyWith<$Res>
    implements $AppPageStateCopyWith<$Res> {
  factory _$$_AppPageStateCopyWith(
          _$_AppPageState value, $Res Function(_$_AppPageState) then) =
      __$$_AppPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$$_AppPageStateCopyWithImpl<$Res>
    extends _$AppPageStateCopyWithImpl<$Res, _$_AppPageState>
    implements _$$_AppPageStateCopyWith<$Res> {
  __$$_AppPageStateCopyWithImpl(
      _$_AppPageState _value, $Res Function(_$_AppPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_$_AppPageState(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AppPageState implements _AppPageState {
  const _$_AppPageState({this.selectedIndex = 0});

  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'AppPageState(selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppPageState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppPageStateCopyWith<_$_AppPageState> get copyWith =>
      __$$_AppPageStateCopyWithImpl<_$_AppPageState>(this, _$identity);
}

abstract class _AppPageState implements AppPageState {
  const factory _AppPageState({final int selectedIndex}) = _$_AppPageState;

  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_AppPageStateCopyWith<_$_AppPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
