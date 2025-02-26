import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';

import '../utils/app_text_style.dart';

class CustomAppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? containerColor;
  final String text;
  final Color? textColor;
  final double? width;
  final double? radius;
  final double? height;
  final Color? borderColor;
  const CustomAppButton(
      {super.key,
      this.onPressed,
      this.containerColor,
      required this.text,
      this.textColor,
      this.width,
      this.radius,
      this.height,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 57,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColors.transparent),
          color: containerColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 12)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyle.style20.copyWith(
            color: textColor ?? AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
