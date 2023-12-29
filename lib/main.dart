import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:soulia/dao/hi_api_cache.dart';
import 'package:soulia/extends/openeye/base/pageWidget/common_stateful_widget.dart';
import 'package:soulia/extends/openeye/pages/main_page.dart';
import 'package:soulia/extends/openeye/route/routes.dart';
import 'package:soulia/extends/openeye/utils/injection.dart';
import 'package:soulia/pages/bottom_navigator.dart';
import 'package:soulia/provider/hi_provider.dart';
import 'package:soulia/provider/theme_provider.dart';
import 'package:soulia/util/hi_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
// import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:login_sdk/dao/login_dao.dart';
import 'package:login_sdk/login_sdk.dart';
import 'package:openai_flutter/http/ai_config.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSDK();
  runApp(
    const MyApp(),
  );
}

///初始化SDK
Future<void> initSDK() async {
  // SharedPreferences.setMockInitialValues({});
  await Injection().init();
}

class MyApp extends CommonStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget get _loadingPage => const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

  // @override
  // void initState() {
  //   super.initState();

  // }

  void requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      // Permission.photos,
      Permission.microphone,
    ].request();

    bool isGranted = statuses.values.every((status) => status.isGranted);
    if (!isGranted) {
      // 如果用户拒绝了任何一个权限，就关闭应用
      SystemNavigator.pop();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: doInit(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        Widget widget;
        if (snapshot.connectionState == ConnectionState.done) {
          widget = LoginDao.getBoardingPass() == null
              // ? const LoginPage()
              ? const BottomNavigator()
              : const BottomNavigator();
        } else {
          return _loadingPage;
          // return const BottomNavigator(); //测试
        }
        return MultiProvider(
          providers: mainProviders,
          child: Consumer<ThemeProvider>(builder: (BuildContext context,
              ThemeProvider themeProvider, Widget? child) {
            return
                // MaterialApp(
                //   debugShowCheckedModeBanner: false,
                //   home: widget,
                //   theme: themeProvider.getTheme(),
                //   title: 'Soulia',
                // );
                GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: widget,
              theme: themeProvider.getTheme(),
              title: 'Soulia',
              getPages: AppRoutes.routerPages,
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 150),
              initialBinding: MainBinding(),
              locale: const Locale('zh'),
            );
          }),
        );
      },
    );
  }

  Future<void> doInit() async {
    initialization();
    // hideScreen();
    requestPermissions();
    await LoginConfig.instance().init(homePage: const BottomNavigator());
    await HiCache.preInit();
    HiAPICache.init(HiCache.getInstance());
    AIConfigBuilder.init(HiConst.apiKey);
    var proxy = HiCache.getInstance().get(HiConst.keyHiProxy);
    AIConfigBuilder.instance.setProxy(proxy);
    // await mockConversation();
  }

  Future<void> initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  // ///hide your splash screen
  // Future<void> hideScreen() async {
  //   Future.delayed(const Duration(milliseconds: 1800), () {
  //     FlutterSplashScreen.hide();
  //   });
  // }
}
