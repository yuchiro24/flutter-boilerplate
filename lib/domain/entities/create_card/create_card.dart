import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_card.freezed.dart';
part 'create_card.g.dart';

@freezed
class CreateCard with _$CreateCard {
  factory CreateCard({
    String? title,
    String? imgBase64,
  }) = _CreateCard;
  CreateCard._();
  factory CreateCard.fromJson(Map<String, dynamic> json) =>
      _$CreateCardFromJson(json);
}
