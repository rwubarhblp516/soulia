// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'WebUrl.g.dart';

@JsonSerializable()
class WebUrl {
  WebUrl({
    this.raw,
    this.forWeibo,
  });

  String? raw;
  String? forWeibo;

  factory WebUrl.fromJson(Map<String, dynamic> json) => _$WebUrlFromJson(json);

  Map<String, dynamic> toJson() => _$WebUrlToJson(this);
}
