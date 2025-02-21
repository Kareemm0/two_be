import 'package:flutter/material.dart';
import 'package:two_be/core/extension/extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomRowTextCategory extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomRowTextCategory({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.style20.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        Text(
          "الكل",
          style: AppTextStyle.style16.copyWith(
            color: AppColors.primaryColor,
          ),
        ).onTap(onTap)
      ],
    );
  }
}
