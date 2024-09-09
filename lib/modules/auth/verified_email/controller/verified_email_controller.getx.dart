import 'package:get/get.dart';

abstract class VerifiedEmailController extends GetxController {
  goToSignIn();
}

class VerifiedEmailControllerImp extends VerifiedEmailController {
  @override
  goToSignIn() {
    // Get.offAllNamed(AppRoutes.signIn);
  }
}
