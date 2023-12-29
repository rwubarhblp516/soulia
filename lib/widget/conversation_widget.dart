import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_message/util/chat_date_format.dart'; //D:\github\my_product\chat_message\lib\util\chat_date_format.dart
import 'package:soulia/model/conversation_model.dart';
import 'package:soulia/util/hi_dialog.dart';
import 'package:flutter/material.dart';
import 'package:soulia/util/padding_extension.dart';

///定义一个带有ConversationModel参数的回调

typedef ConversationCallBack = Function(ConversationModel model);
typedef ConversationStickCallBack = Function(ConversationModel model,
    {required bool isStick});
typedef ConversationTitleChangeCallBack = Function(
    ConversationModel model, String newTitle);

class ConversationWidget extends StatelessWidget {
  final ConversationModel model;
  final ConversationCallBack? onPressed;
  final ConversationCallBack? onDelete;
  final ConversationStickCallBack? onStick;
  final ConversationTitleChangeCallBack? onTitleChange;

  const ConversationWidget(
      {Key? key,
      required this.model,
      this.onPressed,
      this.onDelete,
      this.onStick,
      this.onTitleChange})
      : super(key: key);

  get _item => Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: _itemBackgroundColor,
        height: 76,
        child: Row(
          children: [_icon, 10.paddingWidth, _rightLayout],
        ),
      );

  get _itemBackgroundColor => model.stickTime > 0
      ? Colors.grey.withOpacity(0.2)
      : Colors.white; //置顶的会话背景色

  get _icon => ClipRRect(
        //圆角图片
        borderRadius: BorderRadius.circular(5), //圆角
        child: CachedNetworkImage(imageUrl: model.icon, height: 50, width: 50),
      );

  get _rightLayout => Expanded(
          //右侧布局
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴方向上的对齐方式
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, //交叉轴方向上的对齐方式
            children: [
              5.paddingHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      //自适应宽度
                      child: Text(
                    model.title ?? "", //会话标题
                    maxLines: 1, //不换行
                    overflow: TextOverflow.ellipsis, //超出部分省略号
                    style: const TextStyle(fontSize: 18),
                  )),
                  Text(
                    WechatDateFormat.format(model.updateAt ?? 0),
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              ),
              Text(
                '[${model.messageCount}条对话] ${model.lastMessage}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              )
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.6),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //手势识别
      onTap: () {
        //点击事件
        if (onPressed != null) onPressed!(model);
      },
      onLongPress: () => _showPopMenu(context), //长按事件
      child: _item,
    );
  }

  ///在item下方弹框，难点如何找到要弹框的坐标位置
  _showPopMenu(BuildContext context) {
    var isStick = model.stickTime > 0 ? true : false;
    var showStick = isStick ? "取消置顶" : "置顶";
    HiDialog.showPopMenu(context, offsetX: -50, items: [
      PopupMenuItem(
        child: Text(showStick),
        onTap: () {
          if (onStick != null) onStick!(model, isStick: !isStick);
        },
      ),
      PopupMenuItem(
        child: const Text('修改标题'),
        onTap: () async {
          final newTitle = await _showTitleChangeDialog(context);
          if (newTitle != null && onTitleChange != null) {
            onTitleChange!(model, newTitle);
          }
        },
      ),
      PopupMenuItem(
        child: const Text('删除'),
        onTap: () {
          if (onDelete != null) onDelete!(model);
        },
      )
    ]);
  }

  Future<String?> _showTitleChangeDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('修改标题'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: '请输入新的标题'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(controller.text.trim());
              },
            ),
          ],
        );
      },
    );
  }
}
