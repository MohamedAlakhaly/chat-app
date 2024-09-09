import 'package:chat_app/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final String labelText;
  final void Function()? onTapSuffixIcon;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText ;
  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.suffixIcon, this.onTapSuffixIcon, this.onChanged, this.validator, this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.customSecondGrey,
        ),
        suffixIcon: GestureDetector(
          onTap: onTapSuffixIcon,
          child: Icon(suffixIcon),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
          ,borderSide: const BorderSide(color: Colors.red)
        ),
        hintText: hintText,
      ),
    );
  }
}
