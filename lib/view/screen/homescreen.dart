import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_app/core/constants/theme/appcolors.dart';
import 'package:get_storage_app/view/widgets/custom_authheader.dart';
import '../../controller/auth_controller/login_auth/login_screen_controller.dart';
import 'login_auth_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAuthHeader(title: 'Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              Get.offAll(() => const LoginScreen());
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              "Username: ${authController.username.value}",
              style: const TextStyle(color: AppColors.
              LightPurpleColor,fontWeight: FontWeight.w500,fontSize: 18),
            )),
            const SizedBox(height: 10),
            Obx(() => Text(
              "Email: ${authController.email.value}",style: TextStyle(color: AppColors.
    LightPurpleColor,fontWeight: FontWeight.w500,fontSize: 18),)),

            Obx(()=> Text("Password:${authController.password.value}",style: TextStyle(color:
            AppColors.LightPurpleColor,fontWeight: FontWeight.w500,fontSize: 18),)),
          ],
        ),
      ),
    );
  }
}