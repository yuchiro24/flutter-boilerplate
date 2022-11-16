// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  String get status => throw _privateConstructorUsedError;
  BoardCard? get card => throw _privateConstructorUsedError;
  List<BoardCard> get cards => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;
  String get readStart => throw _privateConstructorUsedError;
  String? get takenPlayerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call(
      {String status,
      BoardCard? card,
      List<BoardCard> cards,
      List<Player> players,
      String readStart,
      String? takenPlayerId});

  $BoardCardCopyWith<$Res>? get card;
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? card = freezed,
    Object? cards = null,
    Object? players = null,
    Object? readStart = null,
    Object? takenPlayerId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as BoardCard?,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BoardCard>,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      readStart: null == readStart
          ? _value.readStart
          : readStart // ignore: cast_nullable_to_non_nullable
              as String,
      takenPlayerId: freezed == takenPlayerId
          ? _value.takenPlayerId
          : takenPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $BoardCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$_BoardCopyWith(_$_Board value, $Res Function(_$_Board) then) =
      __$$_BoardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      BoardCard? card,
      List<BoardCard> cards,
      List<Player> players,
      String readStart,
      String? takenPlayerId});

  @override
  $BoardCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$$_BoardCopyWithImpl<$Res> extends _$BoardCopyWithImpl<$Res, _$_Board>
    implements _$$_BoardCopyWith<$Res> {
  __$$_BoardCopyWithImpl(_$_Board _value, $Res Function(_$_Board) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? card = freezed,
    Object? cards = null,
    Object? players = null,
    Object? readStart = null,
    Object? takenPlayerId = freezed,
  }) {
    return _then(_$_Board(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as BoardCard?,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BoardCard>,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      readStart: null == readStart
          ? _value.readStart
          : readStart // ignore: cast_nullable_to_non_nullable
              as String,
      takenPlayerId: freezed == takenPlayerId
          ? _value.takenPlayerId
          : takenPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Board extends _Board {
  _$_Board(
      {required this.status,
      this.card,
      final List<BoardCard> cards = const <BoardCard>[],
      final List<Player> players = const <Player>[],
      this.readStart = '',
      this.takenPlayerId})
      : _cards = cards,
        _players = players,
        super._();

  factory _$_Board.fromJson(Map<String, dynamic> json) =>
      _$$_BoardFromJson(json);

  @override
  final String status;
  @override
  final BoardCard? card;
  final List<BoardCard> _cards;
  @override
  @JsonKey()
  List<BoardCard> get cards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  final List<Player> _players;
  @override
  @JsonKey()
  List<Player> get players {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final String readStart;
  @override
  final String? takenPlayerId;

  @override
  String toString() {
    return 'Board(status: $status, card: $card, cards: $cards, players: $players, readStart: $readStart, takenPlayerId: $takenPlayerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Board &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.card, card) || other.card == card) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.readStart, readStart) ||
                other.readStart == readStart) &&
            (identical(other.takenPlayerId, takenPlayerId) ||
                other.takenPlayerId == takenPlayerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      card,
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_players),
      readStart,
      takenPlayerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      __$$_BoardCopyWithImpl<_$_Board>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardToJson(
      this,
    );
  }
}

abstract class _Board extends Board {
  factory _Board(
      {required final String status,
      final BoardCard? card,
      final List<BoardCard> cards,
      final List<Player> players,
      final String readStart,
      final String? takenPlayerId}) = _$_Board;
  _Board._() : super._();

  factory _Board.fromJson(Map<String, dynamic> json) = _$_Board.fromJson;

  @override
  String get status;
  @override
  BoardCard? get card;
  @override
  List<BoardCard> get cards;
  @override
  List<Player> get players;
  @override
  String get readStart;
  @override
  String? get takenPlayerId;
  @override
  @JsonKey(ignore: true)
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      throw _privateConstructorUsedError;
}
