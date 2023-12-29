import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soulia/extends/openeye/base/controller/base_controller.dart';
import 'package:soulia/extends/openeye/base/pageWidget/base_stateless_widget.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Focus_Entity.dart';
import 'package:soulia/extends/openeye/pages/find_page/model/Focus_Item_Entity.dart';
import 'package:soulia/extends/openeye/pages/hot_page/widget/item_rank_widget.dart';
import 'package:soulia/extends/openeye/http/apiservice/api_service.dart';
import 'package:soulia/extends/openeye/res/colors.dart';
import 'package:soulia/extends/openeye/utils/keyboard_util.dart';

///搜索页面
class SearchPage extends BaseStatelessWidget<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ItemRankWidget(controller.dataList[index]);
        },
        itemCount: controller.dataList.length);
  }

  @override
  Widget? titleWidget() {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        borderSide: BorderSide(color: ColorStyle.color_white, width: 1.w));
    return Container(
      height: 80.w,
      alignment: Alignment.centerLeft,
      // decoration: BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(width: 10.w, color: ColorStyle.color_white))),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 32.sp, color: ColorStyle.color_white),
        cursorColor: ColorStyle.color_white,
        maxLines: 1,
        controller: controller.editingController,
        decoration: InputDecoration(
          hintText: "请输入搜索内容",
          border: InputBorder.none,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintStyle: TextStyle(color: ColorStyle.color_CCCCCC, fontSize: 32.sp),
        ),
        onChanged: (value) {
          controller.inputValue.value = value;
        },
      ),
    );
  }

  ///搜索按钮
  @override
  List<Widget>? appBarActionWidget(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (controller.inputValue.value.isEmpty) {
              showToast("请输入搜索内容");
              return;
            }
            KeyboardUtils.hideKeyboard(context);
            controller.doSearch(showDialog: true);
          },
          icon: const Icon(Icons.search))
    ];
  }
}

class SearchController extends BaseController<ApiService> {
  TextEditingController editingController = TextEditingController();
  RxString inputValue = "".obs;
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    showEmpty();
  }

  @override
  void loadNet() {
    doSearch();
  }

  void doSearch({bool showDialog = false}) {
    httpRequest<FocusEntity>(api.searchData(inputValue.value), (value) {
      var itemList = value.itemList;
      if (itemList != null && itemList.isNotEmpty) {
        dataList.clear();
        dataList.addAll(itemList);
      } else {
        showEmpty();
      }
    }, showLoading: showDialog);
  }
}

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
