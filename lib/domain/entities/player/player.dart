import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  factory Player({
    required String id,
    String? name,
    required int count,
  }) = _Player;
  Player._();

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
