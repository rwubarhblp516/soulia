// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:soulia/extends/openeye/pages/complain/model/feedback_list_item_entity.dart';

part 'Feedback_detail_list_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackDetailListEntity {
  FeedbackDetailListEntity({
    this.list,
  });

  List<FeedbackListItemEntity>? list;

  factory FeedbackDetailListEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDetailListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackDetailListEntityToJson(this);
}
