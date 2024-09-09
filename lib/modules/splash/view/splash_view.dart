import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/modules/splash/controller/splash_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImp());
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        Text(
          'M',
          style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlaywriteCU',
              color: AppColors.primaryColor),
        ),
        SizedBox(height: 20),
        Text(
          'Chat box',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ],
    ));
  }
}
