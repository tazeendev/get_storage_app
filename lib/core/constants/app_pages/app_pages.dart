import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage_app/routes/app_routes.dart';
import 'package:get_storage_app/view/screen/add_data_view.dart';
import 'package:get_storage_app/view/screen/login_screen_view.dart';
import 'package:get_storage_app/view/screen/signup_auth_screen.dart';

import '../../../view/screen/login_auth_screen.dart';
import '../../../view/screen/welcome_screen.dart';
class AppPage{
  static final pages=[
    GetPage(name: AppRoutes.welcome, page: () => WelcomeScreen()),
    GetPage(name: AppRoutes.login, page:()=>LoginScreen()),
    GetPage(name: AppRoutes.signUp, page:()=>SignUpScreen()),
  ];
}