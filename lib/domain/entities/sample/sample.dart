import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

@freezed
class Sample with _$Sample {
  factory Sample({
    int? id,
  }) = _Sample;
  Sample._();
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}
