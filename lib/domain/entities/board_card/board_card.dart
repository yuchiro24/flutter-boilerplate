import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_card.freezed.dart';
part 'board_card.g.dart';

@freezed
class BoardCard with _$BoardCard {
  factory BoardCard({
    required int id,
    String? title,
    required String img,
  }) = _BoardCard;
  BoardCard._();

  factory BoardCard.fromJson(Map<String, dynamic> json) =>
      _$BoardCardFromJson(json);
}
