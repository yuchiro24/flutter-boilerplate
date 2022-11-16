import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  factory Member({
    @Default('') String id,
    @Default('') String name,
    @Default(false) bool isReady,
  }) = _Member;
  Member._();
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
