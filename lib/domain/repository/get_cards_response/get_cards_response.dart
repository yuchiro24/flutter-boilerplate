import 'package:aufguss_event_app/domain/entities/card/card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cards_response.freezed.dart';
part 'get_cards_response.g.dart';

@freezed
class GetCardsReponse with _$GetCardsReponse {
  factory GetCardsReponse({int? count, required List<Card> results}) =
      _GetCardsReponse;
  GetCardsReponse._();

  factory GetCardsReponse.fromJson(Map<String, dynamic> json) =>
      _$GetCardsReponseFromJson(json);
}
