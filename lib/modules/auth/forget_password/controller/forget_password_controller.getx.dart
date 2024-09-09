import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  sendEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  @override
  sendEmail() {
    //! code send email from firebase

    // Get.offAllNamed(AppRoutes.successSendEmail);
  }
}
