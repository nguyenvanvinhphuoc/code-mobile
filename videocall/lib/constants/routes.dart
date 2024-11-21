import 'package:flutter/material.dart';
import 'package:videocall/screens/call_page.dart';
import 'package:videocall/screens/home_page.dart';
import 'package:videocall/screens/loginPage.dart';

class PageRouteNames {
  static const login = '/login';
  static const home = '/home_page';
  static const call = '/call';
}

class PageParam {
  static String LocalUserID = 'local_user_id';
  static String call_id = 'call_id';
}

Map<String, WidgetBuilder> routes = {
  PageRouteNames.login: (context) => const LoginPage(),
  PageRouteNames.home: (context) => const HomePage(),
  PageRouteNames.call: (context) => const CallPage(),
};
