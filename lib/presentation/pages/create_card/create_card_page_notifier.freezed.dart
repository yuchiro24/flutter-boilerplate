// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_card_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateCardPageState {
  List<CreateCard> get cardList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCardPageStateCopyWith<CreateCardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCardPageStateCopyWith<$Res> {
  factory $CreateCardPageStateCopyWith(
          CreateCardPageState value, $Res Function(CreateCardPageState) then) =
      _$CreateCardPageStateCopyWithImpl<$Res, CreateCardPageState>;
  @useResult
  $Res call({List<CreateCard> cardList});
}

/// @nodoc
class _$CreateCardPageStateCopyWithImpl<$Res, $Val extends CreateCardPageState>
    implements $CreateCardPageStateCopyWith<$Res> {
  _$CreateCardPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardList = null,
  }) {
    return _then(_value.copyWith(
      cardList: null == cardList
          ? _value.cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CreateCard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCardPageStateCopyWith<$Res>
    implements $CreateCardPageStateCopyWith<$Res> {
  factory _$$_CreateCardPageStateCopyWith(_$_CreateCardPageState value,
          $Res Function(_$_CreateCardPageState) then) =
      __$$_CreateCardPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CreateCard> cardList});
}

/// @nodoc
class __$$_CreateCardPageStateCopyWithImpl<$Res>
    extends _$CreateCardPageStateCopyWithImpl<$Res, _$_CreateCardPageState>
    implements _$$_CreateCardPageStateCopyWith<$Res> {
  __$$_CreateCardPageStateCopyWithImpl(_$_CreateCardPageState _value,
      $Res Function(_$_CreateCardPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardList = null,
  }) {
    return _then(_$_CreateCardPageState(
      cardList: null == cardList
          ? _value._cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CreateCard>,
    ));
  }
}

/// @nodoc

class _$_CreateCardPageState implements _CreateCardPageState {
  const _$_CreateCardPageState(
      {final List<CreateCard> cardList = const <CreateCard>[]})
      : _cardList = cardList;

  final List<CreateCard> _cardList;
  @override
  @JsonKey()
  List<CreateCard> get cardList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardList);
  }

  @override
  String toString() {
    return 'CreateCardPageState(cardList: $cardList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCardPageState &&
            const DeepCollectionEquality().equals(other._cardList, _cardList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cardList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCardPageStateCopyWith<_$_CreateCardPageState> get copyWith =>
      __$$_CreateCardPageStateCopyWithImpl<_$_CreateCardPageState>(
          this, _$identity);
}

abstract class _CreateCardPageState implements CreateCardPageState {
  const factory _CreateCardPageState({final List<CreateCard> cardList}) =
      _$_CreateCardPageState;

  @override
  List<CreateCard> get cardList;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCardPageStateCopyWith<_$_CreateCardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
