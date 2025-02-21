import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductNameAndReview extends StatelessWidget {
  const CustomProductNameAndReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "المنتج",
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            SvgPicture.asset(AppImages.star),
            Text(
              "4.5",
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "(20 Review)",
              style: AppTextStyle.style16.copyWith(
                color: AppColors.primaryColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
