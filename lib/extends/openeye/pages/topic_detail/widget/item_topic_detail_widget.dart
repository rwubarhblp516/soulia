import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soulia/extends/openeye/base/pageWidget/common_stateless_widget.dart';
import 'package:soulia/extends/openeye/pages/topic_detail/model/Topic_ItemList.dart';
import 'package:soulia/extends/openeye/res/colors.dart';
import 'package:soulia/extends/openeye/res/style.dart';
import 'package:soulia/extends/openeye/utils/log_utils.dart';
import 'package:soulia/extends/openeye/widget/base_network_image.dart';
import 'package:soulia/extends/openeye/widget/fijkplayer_skin/simple_panel_skin.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ignore: must_be_immutable
class ItemTopicDetailWidget extends CommonStatelessWidget {
  TopicItemList itemData;
  FijkPlayer player;
  int itemIndex; //条目Index
  RxInt playIndex; //正在播放的index
  ValueChanged callback;

  ItemTopicDetailWidget(
      this.itemData, this.player, this.itemIndex, this.playIndex, this.callback,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createContent(context);
  }

  Widget _createContent(BuildContext? context) {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    return Obx(() => VisibilityDetector(
          onVisibilityChanged: (visibilityInfo) {
            if (visibilityInfo.visibleFraction == 0) {
              try {
                var key = visibilityInfo.key as ValueKey;
                if (playIndex.value.toString() == key.value) {
                  LogWTF("滚动监听>>>>>>>>>>${playIndex.value.toString()}");
                  if (null != context) {
                    var isLandscape = context.isLandscape;
                    var width = context.width;
                    var height = context.height;
                    LogD("宽高监听>>>>>>>$width>>>>>>$height");
                    if (!isLandscape) {
                      LogWTF("滚动监听竖屏监听》》》》》》》》");
                      player.reset();
                      playIndex.value = -1;
                    }
                  }
                }
                // ignore: empty_catches
              } catch (e) {
                LogE("滚动控件监听异常>>>>>>>${e.toString()}");
              }
            }
          },
          key: Key(itemIndex.toString()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: playIndex.value == itemIndex
                    ? FijkView(
                        color: ColorStyle.color_black,
                        height: 400.w,
                        player: player,
                        fit: FijkFit.cover,
                        panelBuilder: (FijkPlayer player,
                            FijkData data,
                            BuildContext context,
                            Size viewSize,
                            Rect texturePos) {
                          return simpleFijkPanelBuilder(
                              player, data, context, viewSize, texturePos);
                        },
                        cover: CachedNetworkImageProvider(
                          itemData.data?.content?.data?.cover?.feed ?? "",
                        ),
                      )
                    : Stack(alignment: Alignment.center, children: [
                        BaseNetworkImage(
                          itemData.data?.content?.data?.cover?.feed ?? "",
                          height: 400.w,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          child: Image.asset(
                            "assets/openeye_images/images/icon_play.png",
                            height: 100.w,
                            width: 100.w,
                          ),
                          onTap: () async {
                            var height = context?.size?.height ?? 0;
                            // var height2 = context?.height;
                            // var top = MediaQuery.of(context).viewPadding.top;
                            // LogD("高度>>>>>>$height>>>>>>$height2>>>>>>>>$top");
                            callback(height);
                            playIndex.value = itemIndex;
                            await player.reset();
                            await player.setDataSource(
                                itemData.data?.content?.data?.playUrl ?? "",
                                autoPlay: true);
                          },
                        ),
                      ]),
              ),
              Box.hBox20,
              Text(
                itemData.data?.content?.data?.title ?? "",
                style:
                    TextStyle(fontSize: 26.sp, color: ColorStyle.color_black),
              ),
              Container(
                color: ColorStyle.color_white,
                padding: EdgeInsets.only(
                    left: 32.w, right: 32.w, bottom: 15.w, top: 15.w),
                child: Text(
                  itemData.data?.content?.data?.description ?? "",
                  style: TextStyle(
                      fontSize: 22.sp, color: ColorStyle.color_666666),
                ),
              )
            ],
          ),
        ));
  }
}
