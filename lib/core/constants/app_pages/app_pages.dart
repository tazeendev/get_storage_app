import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage_app/routes/app_routes.dart';
import 'package:get_storage_app/view/screen/add_data_view.dart';
import 'package:get_storage_app/view/screen/login_screen_view.dart';

import '../../../view/screen/welcome_screen.dart';
class AppPage{
  static final pages=[
    GetPage(name: AppRoutes.welcome, page: () => WelcomeScreen()),
    GetPage(name: AppRoutes.login, page:()=>RemoveDataView()),
    GetPage(name: AppRoutes.signUp, page:()=>AddDataView()),
  ];
}