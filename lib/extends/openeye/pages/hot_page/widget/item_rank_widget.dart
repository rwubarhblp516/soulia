import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:soulia/extends/openeye/base/pageWidget/common_stateless_widget.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Focus_Item_Entity.dart';
import 'package:soulia/extends/openeye/res/colors.dart';
import 'package:soulia/extends/openeye/res/style.dart';
import 'package:soulia/extends/openeye/route/routes.dart';
import 'package:soulia/extends/openeye/widget/base_network_image.dart';

// ignore: must_be_immutable
class ItemRankWidget extends CommonStatelessWidget {
  FocusItemEntity itemData;

  ItemRankWidget(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _createContent(),
      onTap: () {
        var playUrl = itemData.data?.playUrl;
        var coverUrl = itemData.data?.cover?.feed;
        var videoId = itemData.data?.id;
        var map = <String, String>{};
        map["playUrl"] = playUrl ?? "";
        map["coverUrl"] = coverUrl ?? "";
        map["videoId"] = "$videoId";
        Get.toNamed(AppRoutes.detailPage, parameters: map);
      },
    );
  }

  Widget _createContent() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400.w,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.w)),
                child: Hero(
                  tag: itemData.data?.id.toString() ?? "",
                  child: BaseNetworkImage(
                    itemData.data?.cover?.feed ?? "",
                    height: 400.w,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 25.w, right: 33.w),
                  height: 42.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(42.w)),
                    color: ColorStyle.color_black_80,
                  ),
                  child: Text(
                    itemData.data?.category ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 150.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Box.wBox16,
                ClipOval(
                  child: BaseNetworkImage(
                    itemData.data?.author?.icon ?? "",
                    width: 80.w,
                    height: 80.w,
                  ),
                ),
                Box.wBox16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500.w,
                      child: Text(
                        itemData.data?.author?.name ?? "",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 30.sp,
                            color: ColorStyle.color_333333,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Box.hBox15,
                    SizedBox(
                      width: 500.w,
                      child: Text(
                        itemData.data?.author?.description ?? "",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 27.sp,
                            color: ColorStyle.color_999999),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
