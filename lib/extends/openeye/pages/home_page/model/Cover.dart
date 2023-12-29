// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'Cover.g.dart';

@JsonSerializable()
class Cover {
  Cover({
    this.feed,
    this.detail,
    this.blurred,
    this.homepage,
  });

  String? feed;
  String? detail;
  String? blurred;
  String? homepage;

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
