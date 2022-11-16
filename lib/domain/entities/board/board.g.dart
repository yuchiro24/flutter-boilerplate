// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Board _$$_BoardFromJson(Map<String, dynamic> json) => _$_Board(
      status: json['status'] as String,
      card: json['card'] == null
          ? null
          : BoardCard.fromJson(json['card'] as Map<String, dynamic>),
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => BoardCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BoardCard>[],
      players: (json['players'] as List<dynamic>?)
              ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Player>[],
      readStart: json['read_start'] as String? ?? '',
      takenPlayerId: json['taken_player_id'] as String?,
    );

Map<String, dynamic> _$$_BoardToJson(_$_Board instance) => <String, dynamic>{
      'status': instance.status,
      'card': instance.card,
      'cards': instance.cards,
      'players': instance.players,
      'read_start': instance.readStart,
      'taken_player_id': instance.takenPlayerId,
    };
