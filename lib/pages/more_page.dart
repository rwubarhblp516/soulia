import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soulia/extends/openeye/pages/main_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  get _news => Row(
        children: [
          ScreenUtilInit(
            designSize: const Size(750, 1334),
            builder: (context, _) => Builder(
              builder: (_) => Center(
                child: CupertinoButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icons/more_icon.png',
                          width: 50, height: 50), //
                      const Text('开眼',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue)),
                    ],
                  ),
                  onPressed: () {
                    Get.offAll(() => const MainPage());
                  },
                ),
              ),
            ),
          ),
        ],
      );

  get _other => const Row(
        children: [Center(child: Text('待开发...'))],
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('其他功能'),
      ),

      child: Column(children: [
        const SizedBox(
          height: 100,
        ),
        const Text(
          '资讯',
          //加粗
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        _news,
        const SizedBox(
          height: 100,
        ),
        const Text(
          '游戏',
          //加粗
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        _other,
        const Text(
          '其它小工具',
          //加粗
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        _other,
      ]),
      // child: Column(
      //   children: [
      //     SizedBox(
      //       height: 100.h,
      //     ),
      //     Row(
      //       children: [
      //         ScreenUtilInit(
      //           designSize: const Size(750, 1334),
      //           builder: (context, _) => Builder(
      //             builder: (_) => Center(
      //               child: CupertinoButton(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: <Widget>[
      //                     Image.asset(
      //                         'assets/icons/more_icon.png'), // 替换为你的图片路径
      //                     const Text('开眼'),
      //                   ],
      //                 ),
      //                 onPressed: () {
      //                   Get.offAll(const MainPage());
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //         ScreenUtilInit(
      //           designSize: const Size(750, 1334),
      //           builder: (context, _) => Builder(
      //             builder: (_) => Center(
      //               child: CupertinoButton(
      //                 child: const Text('开眼'),
      //                 onPressed: () {
      //                   Get.offAll(const MainPage());
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       height: 100.h,
      //     ),
      //     //分割下划线
      //     const Divider(
      //       height: 1,
      //       indent: 0,
      //       color: Colors.grey,
      //     ),
      //     Row(
      //       children: [
      //         ScreenUtilInit(
      //           designSize: const Size(750, 1334),
      //           builder: (context, _) => Builder(
      //             builder: (_) => Center(
      //               child: CupertinoButton(
      //                 child: const Text('开眼'),
      //                 onPressed: () {
      //                   Get.offAll(const MainPage());
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //         ScreenUtilInit(
      //           designSize: const Size(750, 1334),
      //           builder: (context, _) => Builder(
      //             builder: (_) => Center(
      //               child: CupertinoButton(
      //                 child: const Text('开眼'),
      //                 onPressed: () {
      //                   Get.offAll(const MainPage());
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
