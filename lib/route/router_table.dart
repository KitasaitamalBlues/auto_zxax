import 'package:auto_zaxxer/api/support/base_http.dart';
import 'package:auto_zaxxer/pages/home/home_view.dart';
import 'package:auto_zaxxer/pages/login/login_view.dart';
import 'package:flutter/cupertino.dart';

class RouterTable {
  static String splashPath = 'splash';
  static String loginPath = 'login';
  static String homePath = '/';
  static String notFoundPath = '404';

  static Map<String, WidgetBuilder> routeTables = {
    //404页面
    // notFoundPath: (context) => NotFound(),
    //启动页
    // splashPath: (context) => Splash(),
    //登录
    loginPath: (context) => LoginPage(),
    //首页
    homePath: (context) => HomePage(),
  };

  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    return CupertinoPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (routeTables[name] == null) {
          name = notFoundPath;
        }
        if (BaseHttp.token == null) {
          return routeTables[loginPath]!(context);
        }
        Widget widget = routeTables[name]!(context);

        return widget;
      },
    );
  }
}
