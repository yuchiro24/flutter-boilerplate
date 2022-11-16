// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateCard _$CreateCardFromJson(Map<String, dynamic> json) {
  return _CreateCard.fromJson(json);
}

/// @nodoc
mixin _$CreateCard {
  String? get title => throw _privateConstructorUsedError;
  String? get imgBase64 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCardCopyWith<CreateCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCardCopyWith<$Res> {
  factory $CreateCardCopyWith(
          CreateCard value, $Res Function(CreateCard) then) =
      _$CreateCardCopyWithImpl<$Res, CreateCard>;
  @useResult
  $Res call({String? title, String? imgBase64});
}

/// @nodoc
class _$CreateCardCopyWithImpl<$Res, $Val extends CreateCard>
    implements $CreateCardCopyWith<$Res> {
  _$CreateCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? imgBase64 = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imgBase64: freezed == imgBase64
          ? _value.imgBase64
          : imgBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCardCopyWith<$Res>
    implements $CreateCardCopyWith<$Res> {
  factory _$$_CreateCardCopyWith(
          _$_CreateCard value, $Res Function(_$_CreateCard) then) =
      __$$_CreateCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? imgBase64});
}

/// @nodoc
class __$$_CreateCardCopyWithImpl<$Res>
    extends _$CreateCardCopyWithImpl<$Res, _$_CreateCard>
    implements _$$_CreateCardCopyWith<$Res> {
  __$$_CreateCardCopyWithImpl(
      _$_CreateCard _value, $Res Function(_$_CreateCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? imgBase64 = freezed,
  }) {
    return _then(_$_CreateCard(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imgBase64: freezed == imgBase64
          ? _value.imgBase64
          : imgBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateCard extends _CreateCard {
  _$_CreateCard({this.title, this.imgBase64}) : super._();

  factory _$_CreateCard.fromJson(Map<String, dynamic> json) =>
      _$$_CreateCardFromJson(json);

  @override
  final String? title;
  @override
  final String? imgBase64;

  @override
  String toString() {
    return 'CreateCard(title: $title, imgBase64: $imgBase64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCard &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imgBase64, imgBase64) ||
                other.imgBase64 == imgBase64));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, imgBase64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCardCopyWith<_$_CreateCard> get copyWith =>
      __$$_CreateCardCopyWithImpl<_$_CreateCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateCardToJson(
      this,
    );
  }
}

abstract class _CreateCard extends CreateCard {
  factory _CreateCard({final String? title, final String? imgBase64}) =
      _$_CreateCard;
  _CreateCard._() : super._();

  factory _CreateCard.fromJson(Map<String, dynamic> json) =
      _$_CreateCard.fromJson;

  @override
  String? get title;
  @override
  String? get imgBase64;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCardCopyWith<_$_CreateCard> get copyWith =>
      throw _privateConstructorUsedError;
}
