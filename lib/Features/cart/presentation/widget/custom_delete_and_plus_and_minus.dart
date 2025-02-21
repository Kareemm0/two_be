import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomDeleteAndPlusAndMinus extends StatelessWidget {
  const CustomDeleteAndPlusAndMinus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 16,
      children: [
        SvgPicture.asset(AppImages.delete),
        Row(
          spacing: 8,
          children: [
            SvgPicture.asset(
              AppImages.minus,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              "1",
              style:
                  AppTextStyle.style16.copyWith(color: AppColors.primaryColor),
            ),
            SvgPicture.asset(
              AppImages.plus,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        )
      ],
    );
  }
}
