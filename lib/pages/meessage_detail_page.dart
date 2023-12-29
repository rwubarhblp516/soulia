import 'package:chat_message/util/chat_date_format.dart';
import 'package:soulia/model/favorite_model.dart';
import 'package:soulia/util/hi_selection_area.dart';
import 'package:flutter/material.dart';

///展示精彩内容详情
class MessageDetailPage extends StatefulWidget {
  final FavoriteModel model;

  const MessageDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  TapDownDetails? details;

  get _titleView => Align(
        alignment: Alignment.centerRight, // 可以改变这个值来调整对齐方式
        child: Text(
          '来自 ${widget.model.ownerName} ${WechatDateFormat.formatYMd(widget.model.createdAt!)}',
          style: const TextStyle(fontSize: 12),
        ),
      );

  get _listView => ListView(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
        children: [_content],
      );

  get _content => HiSelectionArea.wrap(Text(
        widget.model.content,
        style: const TextStyle(fontSize: 18),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titleView,
      ),
      body: _listView,
    );
  }
}
