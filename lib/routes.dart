// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/activity_add/index.dart';
import 'package:hook_up_rent/page/home/index.dart';
import 'package:hook_up_rent/page/loginMain.dart';
import 'package:hook_up_rent/page/not_found.dart';
import 'package:hook_up_rent/page/register.dart';
import 'package:hook_up_rent/page/room_detail/index.dart';
import 'package:hook_up_rent/page/activity_manage/index.dart';
import 'package:hook_up_rent/page/setting.dart';

class Routes {
  //give name to route
  static String home = '/';
  static String login = '/login';
  //static String login = '/';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String setting = '/setting';
  static String activityManage = '/activityManage';
  static String activityAdd = "/activityAdd";
  //define route variable
  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MainPage();
  });
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomePage();
  });

  static final Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RegisterPage();
  });
  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return NotFoundPage();
  });

  static Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RoomDetailPage(roomId: params['roomId'][0]);
  });
  static final Handler _settingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SettingPage();
  });
  static final Handler _manageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ActivityManagePage();
  });
  static final Handler _activityAddHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ActivityAddPage();
  });
  //configure route method
  static void configureRoutes(FluroRouter router) {
    router.define(login, handler: _loginHandler);
    //router.define(home, handler: _homeHandler);

    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(register, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.define(activityManage, handler: _manageHandler);
    router.define(activityAdd, handler: _activityAddHandler);
    //not found router
    router.notFoundHandler = _notFoundHandler;
  }
}
