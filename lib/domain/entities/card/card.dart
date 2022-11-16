import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Card with _$Card {
  factory Card({
    required String title,
    String? imgBase64,
    String? img,
  }) = _Card;
  Card._();

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
