import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jedi/navigation.dart';
import 'package:jedi/my/setting/setting.dart';
import 'package:jedi/my/change_username.dart';
import 'package:jedi/my/modify_phone.dart';
import 'package:jedi/my/change_password.dart';
import 'package:jedi/my/notification_settings.dart';
import 'package:jedi/my/fans/fans.dart';
import 'package:jedi/my/order/order.dart';
import 'package:jedi/my/landing/landing.dart';
import 'package:jedi/my/about/about.dart';
import 'package:jedi/category/details/details.dart';
import 'package:jedi/category/limited/limited.dart';
import 'package:jedi/category/flash/flash.dart';
import 'package:jedi/category/blocks/single.dart';
import 'package:jedi/category/search/search.dart';
import 'package:jedi/category/result/result.dart';
import 'package:jedi/initiate.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:nautilus/nautilus.dart' as nautilus;

class JediApp extends StatefulWidget {
  @override
  _JediAppState createState() => _JediAppState();
}

class _JediAppState extends State<JediApp> {
  final JPush jpush = JPush();

  @override
  void initState() {
    jpush.setup(
      appKey: "0d900709d234bc9825276054",
      channel: "theChannel",
      production: false,
      // 设置是否打印debug日志。
      debug: false,
    );
    jpush.applyPushAuthority(NotificationSettingsIOS(
      sound: true,
      alert: true,
      badge: true,
    ));
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("接收通知: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("点击通知: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("在接收消息: $message");
      },
    );
    super.initState();
    initTradeService();
  }

  void initTradeService() {
    nautilus.initTradeAsync(debuggable: false).then((data) {
      print('阿里百川初始化结果：${data.isSuccessful}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Material应用组件，它包含了许多Material设计的应用程序通常需要的组件。
    return MaterialApp(
      // 标题属性，用于设备识别应用程序的单行描述。
      // 在Android上，标题显示在任务管理器的应用程序快照上方，但是在iOS上无法使用此值。
      title: 'JEDI',
      // home属性，应用程序默认路径（即`Navigator.defaultRouteName`或`/`）的组件。
      // 除非指定了initialRoute属性，否则这是在应用程序正常启动时首先显示的路由。
      // 如果无法显示initialRoute属性的路径，它也是显示的路径。
      // home: NavigationPage(),
      // 初始路由属性，如果构建了导航器（`Navigator`）组件，则是启动时第一条路由的名称。
      initialRoute: '/',
      // 在生成路由上属性，应用程序导航到命名路由时使用的路由生成器回调。
      onGenerateRoute: _getRoute,
      navigatorObservers: [],
    );
  }

  /// 路由（`Route`）是由导航器（`Navigator`）管理的条目的抽象类。
  /// 路由设置（`RouteSettings`）类是一些可能在构建路由时有用的数据。
  Route<dynamic> _getRoute(RouteSettings settings) {
    // RouteSettings.name属性，路由的名称（例如`/settings`）。
    final String name = settings.name;

    if (name == '/') {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => InitiatePage(),
        fullscreenDialog: true,
      );
      // 主页面路由。
    } else if (name == '/navigation') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => NavigationPage(),
      );
      // 活动页面路由。
    } else if (name == '/web/activity') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => WebviewScaffold(
          url:
              "https://oauth.taobao.com/authorize?response_type=code&client_id=25826707&redirect_uri=https://pgy.ngrok.xiaomiqiu.cn/api/callback&state=1212&view=wap",
          appBar: AppBar(
            centerTitle: true,
            title: Text("Widget webview"),
          ),
        ),
      );
      // 设置页面路由。
    } else if (name == '/my/setting') {
      // Material页面路由（`MaterialPageRoute`）类，通过平台自适应转换替换整个屏幕的模态路由。
      // 对于Android，页面的入口转换会向上滑动页面并淡入其中。退出转换是相同的，但方向相反。
      // 在iOS上，页面从右侧滑入，然后反向退出。当另一页进入以覆盖它时，页面也会在视差中向左移动。
      return MaterialPageRoute(
        // 设置属性，此路由的设置。
        settings: settings,
        // 构建者属性，构建路由的主要内容。
        builder: (BuildContext context) => SettingPage(),
      );
      // 设置-修改昵称页面路由。
    } else if (name == '/my/setting/change_username') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => ChangeUsernamePage(),
      );
      // 设置-修改手机页面路由。
    } else if (name == '/my/setting/modify_phone') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => ModifyPhonePage(),
      );
      // 设置-修改密码页面路由。
    } else if (name == '/my/setting/change_password') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => ChangePasswordPage(),
      );
      // 设置-通知设置页面路由。
    } else if (name == '/my/setting/notification_settings') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => NotificationSettingsPage(),
      );
      // 我的-粉丝页面路由。
    } else if (name == '/my/fans') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => FansPage(),
      );
      // 我的-订单页面路由。
    } else if (name == '/my/order') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => OrderPage(),
      );
      // 我的-登陆页面路由。
    } else if (name == '/my/landing') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => LandingPage(),
      );
      // 我的-关于页面路由。
    } else if (name == '/my/about') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => AboutPage(),
      );
      // 分类-详情页面路由。
    } else if (name == '/category/details') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) =>
            DetailsPage(item: settings.arguments),
      );
      // ��类-限时抢购页面路由。
    } else if (name == '/category/limited') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => LimitedPage(),
      );
      // 分类-品牌闪购页面路由。
    } else if (name == '/category/flash') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => FlashPage(),
      );
      // 分类-单分类页面路由。
    } else if (name == '/category/single') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) =>
            SinglePage(parameter: settings.arguments),
      );
      // 分类-搜索页面路由。
    } else if (name == '/category/search') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => SearchPage(),
      );
      // 分类-搜索结果页面路由。
    } else if (name == '/category/result') {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) =>
            ResultPage(parameter: settings.arguments),
      );
    } else {
      return null;
    }
  }
}
