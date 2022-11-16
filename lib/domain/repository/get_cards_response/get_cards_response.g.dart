// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetCardsReponse _$$_GetCardsReponseFromJson(Map<String, dynamic> json) =>
    _$_GetCardsReponse(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetCardsReponseToJson(_$_GetCardsReponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };
