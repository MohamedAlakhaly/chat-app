import 'package:get/get.dart';

abstract class SuccessSendEmailController extends GetxController {
  goToSignIn();
  resendEmail();
}

class SuccessSendEmailControllerImp extends SuccessSendEmailController {
  @override
  goToSignIn() {
    // Get.offNamed(AppRoutes.signIn);
  }

  @override
  resendEmail() {}
}
