import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWithImage extends StatelessWidget {
  final String buttonImage;
  final String buttonText;
  final void Function() onTapButton;
  const CustomButtonWithImage({
    super.key,
    required this.buttonImage,
    required this.buttonText,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(buttonImage),
            const SizedBox(width: 10),
            Text(
              buttonText,
              style: const TextStyle(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontsSize.extraSmallFontSize),
            ),
          ],
        ),
      ),
    );
  }
}