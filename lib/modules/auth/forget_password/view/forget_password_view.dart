import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/constant/app_images.dart';
import 'package:chat_app/global/custom_button_with_icon.dart';
import 'package:chat_app/global/custom_text_form_field.dart';
import 'package:chat_app/modules/auth/forget_password/controller/forget_password_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                AppImages.forgetPasswordImg,
                height: 300,
              ),
              const Text(
                'don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.customSecondGrey,
                    fontSize: AppFontsSize.extraSmallFontSize - 1),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Enter your E-mail',
                  labelText: 'E-mail'),
              const SizedBox(height: 20),
              CustomButtonWithIcon(
                buttonText: 'Send Email',
                onTapButton: controller.sendEmail,
                buttonIcon: Iconsax.send_14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
