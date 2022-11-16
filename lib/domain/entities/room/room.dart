import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  factory Room({
    required String id,
    String? title,
    required int digits,
  }) = _Room;
  Room._();

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}