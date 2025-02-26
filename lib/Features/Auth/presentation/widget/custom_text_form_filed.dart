import 'package:flutter/material.dart';
import 'package:two_be/core/functions/out_line_input_border.dart';
import 'package:two_be/core/utils/app_text_style.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? errorColor;
  final bool? enabled;
  final Color? hintColor;
  final Color? textInputColor;
  const CustomTextFormFiled(
      {super.key,
      required this.controller,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.borderColor,
      this.errorColor,
      this.enabled,
      this.hintColor,
      this.textInputColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: AppTextStyle.style14
          .copyWith(color: textInputColor ?? AppColors.secondaryColor),
      decoration: InputDecoration(
        hintStyle: AppTextStyle.style14
            .copyWith(color: hintColor ?? AppColors.secondaryColor),
        hintText: hintText,
        hintFadeDuration: Duration(seconds: 1),
        suffixIcon: suffixIcon,
        border: outLineInputBorder(color: borderColor),
        focusedBorder: outLineInputBorder(color: borderColor),
        enabledBorder: outLineInputBorder(color: borderColor),
        errorBorder: outLineInputBorder(color: errorColor),
        focusedErrorBorder: outLineInputBorder(color: borderColor),
        disabledBorder: outLineInputBorder(color: borderColor),
      ),
    );
  }
}
