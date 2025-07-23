import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage_app/core/constants/theme/appcolors.dart';

import '../../routes/app_routes.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
Container(
  height:screenHeight*1 ,
  width: screenWidth*1,
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/images/sweet.jpg'),fit: BoxFit.cover),
  ),
),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 110),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FRESH" ,style: TextStyle(color: AppColors.pinkColor,fontSize: screenWidth*0.1,fontWeight: FontWeight.w600),),
                        Text(' DELIGHT',style: TextStyle(color: AppColors.whiteColor,fontSize: screenWidth*0.1,fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Text('Made with love and sprinkled with joy \n Take a bite of happiness today!',
                      style: TextStyle(color: AppColors.LightBrownColor,fontSize:16,fontWeight: FontWeight.w500),),
                    SizedBox(height: screenHeight*0.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: ()=>Get.toNamed(AppRoutes.login),
                          child: Container(
                            height: 40,
                            width: 150,
                            color: AppColors.LightBlueColor,
                            child: Center(child: Text('login',style: TextStyle(color: AppColors.whiteColor),)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.signUp),
                          child: Container(
                            height: 40,
                            width: 150,
                            color: AppColors.LightPinkColor,
                            child: Center(child: Text('signup',style: TextStyle(color: AppColors.whiteColor),)),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            )],
          )
        ],
      ),
    );
  }
}
