import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/constant/app_images.dart';
import 'package:chat_app/global/custom_button_with_icon.dart';
import 'package:chat_app/global/custom_button_with_image.dart';
import 'package:chat_app/global/custom_text_form_field.dart';
import 'package:chat_app/modules/auth/sign_in/controller/sign_in_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 120,
                ),
                child: Text(
                  'Welcome to Tamang Food Services',
                  style: TextStyle(fontSize: AppFontsSize.extraLargeFontSize),
                ),
              ),
              const Text(
                'Enter your Phone number or Email address for sign in. Enjoy your food :)',
                style: TextStyle(
                    color: AppColors.customSecondGrey,
                    fontSize: AppFontsSize.extraSmallFontSize),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: 'E-mail',
                hintText: 'Enter your Email',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 10),
              const CustomTextFormField(
                labelText: 'password',
                hintText: 'Enter your Password',
                prefixIcon: Iconsax.lock,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: controller.forgetPassword,
                child: const Text(
                  'Forget Password ?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              CustomButtonWithIcon(
                buttonIcon: Iconsax.arrow_right_14,
                onTapButton: controller.signInApp,
                buttonText: 'SIGN IN',
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.customSecondGrey,
                  )),
                  SizedBox(width: 10),
                  Text('OR'),
                  SizedBox(width: 10),
                  Expanded(child: Divider(color: AppColors.customSecondGrey)),
                ],
              ),
              const SizedBox(height: 20),
              CustomButtonWithImage(
                buttonText: 'Sign in with Google',
                buttonImage: AppImages.googleImg,
                onTapButton: () {
                  
                },
              ),
              const SizedBox(height: 10),
              CustomButtonWithImage(
                buttonText: 'Sign in with facebook',
                buttonImage: AppImages.facebookImg,
                onTapButton: () {},
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create a new account ? ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: controller.goToSignUp,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
