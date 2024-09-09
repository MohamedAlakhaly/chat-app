import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/constant/app_images.dart';
import 'package:chat_app/global/custom_button_with_icon.dart';
import 'package:chat_app/modules/auth/success_send_email/controller/success_send_email_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SuccessSendEmailView extends StatelessWidget {
  const SuccessSendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSendEmailControllerImp controller =
        Get.put(SuccessSendEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Send Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                AppImages.sendEmailImg,
                height: 300,
              ),
              const Text(
                'A link to reset password has been sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.customSecondGrey,
                    fontSize: AppFontsSize.extraSmallFontSize - 1),
              ),
              const SizedBox(height: 20),
              CustomButtonWithIcon(
                buttonText: 'Sign In',
                onTapButton: controller.goToSignIn,
                buttonIcon: Icons.check,
              ),
              const SizedBox(height: 10),
              CustomButtonWithIcon(
                buttonText: 'Resend',
                onTapButton: () {},
                buttonIcon: Iconsax.send_14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
