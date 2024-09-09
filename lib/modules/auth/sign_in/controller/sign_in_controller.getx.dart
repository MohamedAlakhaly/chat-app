import 'package:chat_app/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  forgetPassword();
  signInApp();
  goToSignUp();
}

class SignInControllerImp extends SignInController {
  
  @override
  forgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  signInApp() {
    // Get.offAllNamed(AppRoutes);
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUn);
  }
}
