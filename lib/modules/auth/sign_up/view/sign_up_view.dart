import 'package:chat_app/constant/app_colors.dart';
import 'package:chat_app/constant/app_images.dart';
import 'package:chat_app/global/custom_button_with_icon.dart';
import 'package:chat_app/global/custom_button_with_image.dart';
import 'package:chat_app/global/custom_text_form_field.dart';
import 'package:chat_app/global/verify_input.dart';
import 'package:chat_app/modules/auth/sign_up/controller/sign_up_controller.getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: controller.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create Account',
                  style: TextStyle(fontSize: AppFontsSize.extraLargeFontSize),
                ),
                const Text(
                  'Enter your Name, Email and Password for sign up.',
                  style: TextStyle(
                      color: AppColors.customSecondGrey,
                      fontSize: AppFontsSize.extraSmallFontSize),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        validator: (val) {
                          return verifyInput(9, 1, val!, 'name');
                        },
                        controller: controller.firstName,
                        labelText: 'First Name',
                        hintText: 'Enter your First Name',
                        prefixIcon: Iconsax.personalcard4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        validator: (val) {
                          return verifyInput(9, 1, val!, 'name');
                        },
                        controller: controller.lastName,
                        labelText: 'Last Name',
                        hintText: 'Enter your Last Name',
                        prefixIcon: Iconsax.personalcard4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  validator: (val) {
                    return verifyInput(9, 1, val!, 'username');
                  },
                  controller: controller.username,
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icons.person_2_outlined,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  validator: (val) {
                    return verifyInput(15, 1, val!, 'phone');
                  },
                  controller: controller.phoneNumber,
                  labelText: 'phone',
                  hintText: 'Enter your phone number',
                  prefixIcon: Icons.phone_outlined,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  validator: (val) {
                    return verifyInput(100, 1, val!, 'email');
                  },
                  controller: controller.email,
                  labelText: 'E-mail',
                  hintText: 'Enter your e-mail',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  validator: (val) {
                    return verifyInput(9, 1, val!, 'name');
                  },
                  obscureText: true,
                  controller: controller.password,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Iconsax.lock,
                ),
                const SizedBox(height: 10),
                CustomButtonWithIcon(
                  buttonIcon: Iconsax.arrow_right_14,
                  onTapButton: controller.createNewAccount,
                  buttonText: 'SIGN UP',
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
                  buttonText: 'Sign up with Google',
                  buttonImage: AppImages.googleImg,
                  onTapButton: () {},
                ),
                const SizedBox(height: 10),
                CustomButtonWithImage(
                  buttonText: 'Sign up with facebook',
                  buttonImage: AppImages.facebookImg,
                  onTapButton: () {},
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I have an account :) ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.goToSignIn,
                      child: const Text(
                        'Sign in',
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
      ),
    );
  }
}
