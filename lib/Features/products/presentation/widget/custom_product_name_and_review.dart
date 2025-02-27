import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/core/utils/app_sizes.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductNameAndReview extends StatelessWidget {
  final String productName;
  final int review;
  const CustomProductNameAndReview(
      {super.key, required this.productName, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            productName,
            style: AppTextStyle.style16.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        width(16),
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
              "($review Review)",
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
