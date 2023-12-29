import 'package:get/get.dart';
import 'package:soulia/extends/openeye/pages/common/photo_preview_page.dart';
import 'package:soulia/extends/openeye/pages/complain/complain_common_page.dart';
import 'package:soulia/extends/openeye/pages/complain/complain_home_page.dart';
import 'package:soulia/extends/openeye/pages/complain/complain_my_list_page.dart';
import 'package:soulia/extends/openeye/pages/complain/complain_recod_page.dart';
import 'package:soulia/extends/openeye/pages/complain/complain_submit_page.dart';
import 'package:soulia/extends/openeye/pages/custom_paint_page/custom_paint_page.dart';
import 'package:soulia/extends/openeye/pages/detail_page/detail_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/category_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/focus_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/children_page/topic_page.dart';
import 'package:soulia/extends/openeye/pages/find_page/find_page.dart';
import 'package:soulia/extends/openeye/pages/home_page/home_page.dart';
import 'package:soulia/extends/openeye/pages/hot_page/children_page/rank_list_page.dart';
import 'package:soulia/extends/openeye/pages/hot_page/hot_page.dart';
import 'package:soulia/extends/openeye/pages/main_page.dart';
import 'package:soulia/extends/openeye/pages/mine_page/mine_page.dart';
import 'package:soulia/extends/openeye/pages/seach_page/search_page.dart';
import 'package:soulia/extends/openeye/pages/topic_detail/topic_detail_page.dart';
import 'package:soulia/extends/openeye/pages/type_detail/type_detail_page.dart';
import 'package:soulia/pages/more_page.dart';

abstract class AppRoutes {
  static const morePage = "/more_page"; //更多页面
  static const mainPage = "/main_page"; //主页Main
  static const homePage = "/home_page"; //首页Tab
  static const findPage = "/find_page"; //发现Tab
  static const hotPage = "/hot_page"; //热门Tab
  static const minePage = "/mine_page"; //我的Tab
  static const focusPage = "/focus_page"; //关注页面
  static const categoryPage = "/category_page"; //分类页面
  static const topicPage = "/topic_page"; //专题页面
  static const rankingWeekPage = "/ranking_week_page"; //排行榜页面-星期
  static const rankingMonthPage = "/ranking_month_page"; //排行榜页面-月
  static const rankingHistoryPage = "/ranking_history_page"; //排行榜页面-总榜
  static const searchPage = "/search_page"; //搜索页面
  static const detailPage = "/detail_page"; //视频详情页面
  static const typeDetailPage = "/type_detail_page"; //分类详情页面
  static const topicDetailPage = "/topic_detail_page"; //专题详情页面
  static const photoPreviewPage = "/photo_preview_page"; //通用图片预览
  static const complainHomePage = "/complain_home_page"; //投诉反馈首页
  static const complainCommonPage = "/complain_common_page"; //投诉反馈普通问题页面
  static const complainSubmitPage = "/complain_submit_page"; //投诉反馈-提交问题
  static const complainMylistPage = "/complain_my_list_page"; //投诉反馈-我的反馈
  static const complainMyRecordPage = "/complain_my_record_page"; //我的反馈-我的反馈
  static const customPaintPage = "/custom_paint_page"; //自定义控件

  static final routerPages = [
    ///主入口
    GetPage(
        name: AppRoutes.mainPage,
        page: () => const MainPage(),
        binding: MainBinding()),

    // ///更多页面
    // GetPage(
    //     name: AppRoutes.morePage,
    //     page: () => const MorePage(),
    //     binding: MoreBinding()),

    ///首页Tab
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    ///热门Tab
    GetPage(
        name: AppRoutes.hotPage,
        page: () => HotPage(tagType: "route"),
        binding: HotBinding(),
        children: [
          GetPage(
              name: AppRoutes.rankingWeekPage,
              page: () => RankListPage(rankType: 'weekly', tagType: "route"),
              binding: RankListBinding()),
          GetPage(
              name: AppRoutes.rankingMonthPage,
              page: () => RankListPage(rankType: 'monthly', tagType: "route"),
              binding: RankListBinding()),
          GetPage(
              name: AppRoutes.rankingHistoryPage,
              page: () =>
                  RankListPage(rankType: 'historical', tagType: "route"),
              binding: RankListBinding()),
        ]),

    ///发现Tab
    GetPage(
        name: AppRoutes.findPage,
        page: () => const FindPage(),
        binding: FindBinding(),
        children: [
          GetPage(
              name: AppRoutes.focusPage,
              page: () => FocusPage(tagType: "route"),
              binding: FocusBinding()),
          GetPage(
              name: AppRoutes.categoryPage,
              page: () => CategoryPage(tagType: "route"),
              binding: CategoryBinding()),
          GetPage(
              name: AppRoutes.topicPage,
              page: () => TopicPage(tagType: "route"),
              binding: TopicBinding())
        ]),

    ///我的Tab
    GetPage(
        name: AppRoutes.minePage,
        page: () => const MinePage(),
        binding: MineBinding()),

    ///搜索页面
    GetPage(
        name: AppRoutes.searchPage,
        page: () => const SearchPage(),
        binding: SearchBinding(),
        transitionDuration: const Duration(milliseconds: 500),
        transition: Transition.circularReveal),

    ///视频详情
    GetPage(
        name: AppRoutes.detailPage,
        page: () => const DetailPage(),
        binding: DetailBinding(),
        transitionDuration: const Duration(milliseconds: 350),
        transition: Transition.fadeIn),

    ///分类详情
    GetPage(
      name: AppRoutes.typeDetailPage,
      page: () => const TypeDetailPage(),
      binding: TypeDetailBinding(),
    ),

    ///专题详情
    GetPage(
      name: AppRoutes.topicDetailPage,
      page: () => const TopicDetailPage(),
      binding: TopicDetailBinding(),
    ),

    GetPage(
        name: complainHomePage,
        transition: Transition.zoom,
        page: () => const ComplainHomePage(),
        binding: ComplainHomeBinding(),
        children: [
          GetPage(
              name: complainCommonPage,
              page: () => const ComplainCommonPage(),
              binding: ComplainCommonBinding()),
          GetPage(
              name: complainSubmitPage,
              page: () => const ComplainSubmitPage(),
              binding: ComplainSubmitBinding()),
          GetPage(
              name: complainMylistPage,
              page: () => const ComplainMyListPage(),
              binding: ComplainMyListBinding()),
          GetPage(
              name: complainMyRecordPage,
              page: () => const ComplainRecordPage(),
              binding: ComplainRecordBinding()),
        ]),

    ///图片预览页面
    GetPage(
        name: photoPreviewPage,
        transition: Transition.zoom,
        page: () => const PhotoPreviewPage(),
        binding: PhotoPreviewBinding()),

    ///自定义控件预览
    GetPage(
        name: customPaintPage,
        page: () => const CustomPaintPage(),
        binding: CustomPaintBinding())
  ];
}
