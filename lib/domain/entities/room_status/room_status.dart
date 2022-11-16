import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_status.freezed.dart';
part 'room_status.g.dart';

@freezed
class RoomStatus with _$RoomStatus {
  factory RoomStatus({
    @Default('') String status,
  }) = _RoomStatus;
  RoomStatus._();
  factory RoomStatus.fromJson(Map<String, dynamic> json) =>
      _$RoomStatusFromJson(json);
}
