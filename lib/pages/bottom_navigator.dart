// ignore_for_file: unused_field

import 'package:soulia/pages/conversation_list_page.dart';
import 'package:soulia/pages/more_page.dart';
import 'package:soulia/pages/my_page.dart';
// import 'package:soulia/pages/study_page.dart';
import 'package:soulia/pages/wonderful_page.dart';
import 'package:soulia/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:login_sdk/util/navigator_util.dart';
import 'package:provider/provider.dart';

///首页底部导航器
class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final PageController _controller = PageController(initialPage: 1);
  final defaultColor = Colors.grey;
  var _activeColor = Colors.pink;
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    //更新导航器的context，供退出登录时使用
    NavigatorUtil.updateContext(context);
    var themeProvider = context.watch<ThemeProvider>();
    _activeColor = themeProvider.themeColor;
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          WonderfulPage(),
          ConversationListPage(),
          // StudyPage(),
          MyPage(),
          MorePage()
          // MorePage(),
          // HotPage(
          //   tagType: "home",
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // 选中项的颜色
        unselectedItemColor: Colors.grey, // 未选中项的颜色
        items: [
          _bottomItem(
              '收藏',
              Image.asset('assets/icons/collect_icon.png',
                  width: 30, height: 30),
              0),
          _bottomItem(
              '聊天',
              Image.asset('assets/icons/chat_icon.png', width: 34, height: 34),
              1),
          // _bottomItem('学习', Icons.newspaper, 2),
          _bottomItem(
              '设置',
              Image.asset('assets/icons/set_icon.png', width: 30, height: 30),
              2),
          _bottomItem(
              '其他',
              Image.asset('assets/icons/more_icon.png', width: 30, height: 30),
              3),
        ],
      ),
    );
  }

  _bottomItem(String title, Widget icon, int index) {
    return BottomNavigationBarItem(icon: icon, activeIcon: icon, label: title);
  }
}
