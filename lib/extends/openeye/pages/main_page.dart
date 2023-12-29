import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soulia/extends/openeye/base/controller/base_controller.dart';
import 'package:soulia/extends/openeye/base/pageWidget/base_stateful_widget.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/category_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/focus_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/topic_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/find_page.dart';
import 'package:soulia/extends/openeye/pages/home_page/home_page.dart';
import 'package:soulia/extends/openeye/pages/hot_page/children_page/rank_list_page.dart';
import 'package:soulia/extends/openeye/pages/hot_page/hot_page.dart';
import 'package:soulia/extends/openeye/pages/mine_page/mine_page.dart';
import 'package:soulia/extends/openeye/res/colors.dart';
import 'package:soulia/extends/openeye/utils/log_utils.dart';
import 'package:soulia/extends/openeye/widget/keep_alive_wrapper.dart';
import 'package:soulia/pages/bottom_navigator.dart';

class MainPage extends BaseStatefulWidget<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // 返回MorePage
                Get.offAll(() => const BottomNavigator());
              },
            ),
          ),
          body: KeepAliveWrapper(
            child: PageView(
              controller: controller._pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.naviItems,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller._curPage.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: "发现"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department), label: "热门"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
            ],
            fixedColor: ColorStyle.color_black_80,
            onTap: (int index) {
              //跳转到指定页面
              controller._pageController.jumpToPage(index);
              controller._curPage.value = index;
            },
          ),
        ),
        onWillPop: () async {
          if (controller.lastPopTime == null ||
              DateTime.now().difference(controller.lastPopTime!) >
                  const Duration(seconds: 2)) {
            // 存储当前按下back键的时间
            controller.lastPopTime = DateTime.now();
            // toast
            showToast("再按一次退出app");
            return false;
          } else {
            controller.lastPopTime = DateTime.now();
            // 退出app
            await SystemNavigator.pop();
            return true;
          }
        }));
  }

  @override
  bool showTitleBar() => false;
}

class MainController extends BaseController {
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> naviItems = [
    const HomePage(),
    const FindPage(),
    HotPage(
      tagType: "home",
    ),
    const MinePage()
  ];

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    showSuccess();
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    LogD(">>>>>>>>>>>>开始注入代码");
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => HotController(), tag: "home");
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => FocusController(), tag: "home");
    Get.lazyPut(() => CategoryController(), tag: "home");
    Get.lazyPut(() => TopicController(), tag: "home");
    Get.lazyPut(() => RankListController(), tag: "home_weekly");
    Get.lazyPut(() => RankListController(), tag: "home_monthly");
    Get.lazyPut(() => RankListController(), tag: "home_historical");
  }
}
