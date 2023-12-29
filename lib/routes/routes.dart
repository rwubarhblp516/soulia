import 'package:get/get.dart';
import 'package:soulia/extends/openeye/pages/main_page.dart';

abstract class OpenEyeRoutes {
  static const openEyePage = '/openEye';

  ///主入口
  static final routerPages = [
    GetPage(
        name: OpenEyeRoutes.openEyePage,
        page: () => const MainPage(),
        binding: MainBinding()),
  ];
}
