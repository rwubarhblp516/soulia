import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulia/extends/openeye/base/pageWidget/common_stateless_widget.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Focus_Item_Entity.dart';
import 'package:soulia/extends/openeye/pages/find_page/widget/item_focus_inner_widget.dart';
import 'package:soulia/extends/openeye/res/colors.dart';
import 'package:soulia/extends/openeye/res/style.dart';
import 'package:soulia/extends/openeye/widget/base_network_image.dart';

class ItemFocusOuterWidget extends CommonStatelessWidget {
  final FocusItemEntity itemData;

  ItemFocusOuterWidget(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Box.wBox16,
              ClipOval(
                child: BaseNetworkImage(
                  itemData.data?.header?.icon ?? "",
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
                      itemData.data?.header?.title ?? "",
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
                      itemData.data?.header?.description ?? "",
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
        ),
        SizedBox(
          height: 400.w,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _createInnerWidget(index);
            },
            itemCount: itemData.data?.itemList?.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        DividerStyle.divider2Padding20
      ],
    );
  }

  Widget _createInnerWidget(int index) {
    var itemList = itemData.data?.itemList;
    if (itemList != null && itemList.isNotEmpty) {
      var item = itemList[index];
      return ItemFocusInnerWidget(item);
    } else {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
