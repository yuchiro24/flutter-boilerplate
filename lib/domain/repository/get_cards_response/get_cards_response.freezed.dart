// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_cards_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetCardsReponse _$GetCardsReponseFromJson(Map<String, dynamic> json) {
  return _GetCardsReponse.fromJson(json);
}

/// @nodoc
mixin _$GetCardsReponse {
  int? get count => throw _privateConstructorUsedError;
  List<Card> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCardsReponseCopyWith<GetCardsReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCardsReponseCopyWith<$Res> {
  factory $GetCardsReponseCopyWith(
          GetCardsReponse value, $Res Function(GetCardsReponse) then) =
      _$GetCardsReponseCopyWithImpl<$Res, GetCardsReponse>;
  @useResult
  $Res call({int? count, List<Card> results});
}

/// @nodoc
class _$GetCardsReponseCopyWithImpl<$Res, $Val extends GetCardsReponse>
    implements $GetCardsReponseCopyWith<$Res> {
  _$GetCardsReponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetCardsReponseCopyWith<$Res>
    implements $GetCardsReponseCopyWith<$Res> {
  factory _$$_GetCardsReponseCopyWith(
          _$_GetCardsReponse value, $Res Function(_$_GetCardsReponse) then) =
      __$$_GetCardsReponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<Card> results});
}

/// @nodoc
class __$$_GetCardsReponseCopyWithImpl<$Res>
    extends _$GetCardsReponseCopyWithImpl<$Res, _$_GetCardsReponse>
    implements _$$_GetCardsReponseCopyWith<$Res> {
  __$$_GetCardsReponseCopyWithImpl(
      _$_GetCardsReponse _value, $Res Function(_$_GetCardsReponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? results = null,
  }) {
    return _then(_$_GetCardsReponse(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetCardsReponse extends _GetCardsReponse {
  _$_GetCardsReponse({this.count, required final List<Card> results})
      : _results = results,
        super._();

  factory _$_GetCardsReponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetCardsReponseFromJson(json);

  @override
  final int? count;
  final List<Card> _results;
  @override
  List<Card> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'GetCardsReponse(count: $count, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCardsReponse &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCardsReponseCopyWith<_$_GetCardsReponse> get copyWith =>
      __$$_GetCardsReponseCopyWithImpl<_$_GetCardsReponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetCardsReponseToJson(
      this,
    );
  }
}

abstract class _GetCardsReponse extends GetCardsReponse {
  factory _GetCardsReponse(
      {final int? count,
      required final List<Card> results}) = _$_GetCardsReponse;
  _GetCardsReponse._() : super._();

  factory _GetCardsReponse.fromJson(Map<String, dynamic> json) =
      _$_GetCardsReponse.fromJson;

  @override
  int? get count;
  @override
  List<Card> get results;
  @override
  @JsonKey(ignore: true)
  _$$_GetCardsReponseCopyWith<_$_GetCardsReponse> get copyWith =>
      throw _privateConstructorUsedError;
}
