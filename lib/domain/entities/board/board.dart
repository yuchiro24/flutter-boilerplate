import 'package:aufguss_event_app/domain/entities/board_card/board_card.dart';
import 'package:aufguss_event_app/domain/entities/player/player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  factory Board({
    required String status,
    BoardCard? card,
    @Default(<BoardCard>[]) List<BoardCard> cards,
    @Default(<Player>[]) List<Player> players,
    @Default('') String readStart,
    String? takenPlayerId,
  }) = _Board;
  Board._();

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
