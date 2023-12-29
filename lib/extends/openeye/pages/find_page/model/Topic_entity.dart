// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Topic_data_entity.dart';

part 'Topic_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class TopicEntity {
  TopicEntity({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
  });

  List<TopicDataEntity>? itemList;
  int? count;
  int? total;
  String? nextPageUrl;
  bool? adExist;

  factory TopicEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopicEntityToJson(this);
}
