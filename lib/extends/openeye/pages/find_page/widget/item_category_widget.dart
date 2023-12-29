import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulia/extends/openeye/base/pageWidget/common_stateless_widget.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Type_entity.dart';
import 'package:soulia/extends/openeye/res/colors.dart';

// ignore: must_be_immutable
class ItemCategoryWidget extends CommonStatelessWidget {
  TypeEntity itemData;

  ItemCategoryWidget(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 350.w,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(itemData.bgPicture ?? ""))),
      child: Text(
        itemData.name ?? "",
        style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: ColorStyle.color_white),
      ),
    );
  }
}
