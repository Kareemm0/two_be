import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomRowTextCategory extends StatelessWidget {
  final String text;
  const CustomRowTextCategory({super.key, required this.text});

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
        )
      ],
    );
  }
}
