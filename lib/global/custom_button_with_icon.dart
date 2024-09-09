import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';


class CustomButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final void Function() onTapButton;
  const CustomButtonWithIcon({
    super.key,
    required this.buttonText,
    this.buttonIcon,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: AppFontsSize.extraSmallFontSize - 1),
            ),
            const SizedBox(width: 10),
            Icon(
              buttonIcon,
              color: AppColors.textWhite,
            )
          ],
        ),
      ),
    );
  }
}
