import 'package:chat_app/constant/app_routes.dart';
import 'package:chat_app/services/services.dart';
import 'package:get/get.dart';

abstract class SplashController extends GetxController {
  startApp();
}

class SplashControllerImp extends SplashController {
  AppServices services = Get.find();

  @override
  Future<void> startApp() async {
    await Future.delayed(const Duration(seconds: 3));
    services.sharedPreferences.getString('username') == null ? Get.offAllNamed(AppRoutes.signIn):Get.offAllNamed(AppRoutes.homeView);
  }

  @override
  void onInit() {
    startApp();
    super.onInit();
  }
}
