import 'dart:io';
import 'package:chat_app/constant/app_routes.dart';
import 'package:chat_app/modules/profile/view/profile_screen.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDUNeu4Ox6JA5jqCvgPGi-nDUKPubqlP7U',
              appId: '1:1078542162828:android:8d002e295cd0cf44fa54a9',
              messagingSenderId: '1078542162828',
              projectId: 'chat-app-f7e64'),
        )
      : await Firebase.initializeApp();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chap App',
      initialRoute: AppRoutes.splashView,
      getPages: getPages,
      // home: const ProfileScreen(),
      theme:AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
    );
  }
}
