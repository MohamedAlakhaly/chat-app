import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/global/custom_button_with_icon.dart';
import 'package:chat_app/modules/auth/verified_email/controller/verified_email_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifiedEmailView extends StatelessWidget {
  const VerifiedEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    VerifiedEmailControllerImp controller =
        Get.put(VerifiedEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verified email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SvgPicture.asset(
              //   AppImages.verifiedEmail,
              // ),
              Text(
                'Verify E-mail',
              ),
              const Text(
                'We have sent yo a link to your account to confirm your Email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.customSecondGrey,
                    fontSize: AppFontsSize.extraSmallFontSize - 1),
              ),
              const SizedBox(height: 10),
              CustomButtonWithIcon(
                buttonText: 'Sign In',
                onTapButton: controller.goToSignIn,
                buttonIcon: Iconsax.arrow_right_14,
              )
            ],
          ),
        ),
      ),
    );
  }
}