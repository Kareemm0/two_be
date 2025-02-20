import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';

class CustomSocialMediaButtons extends StatelessWidget {
  const CustomSocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.secondaryColor,
              ),
            ),
            child: SvgPicture.asset(AppImages.google),
          ),
        ),
        width(8),
        Flexible(child: Container())
      ],
    );
  }
}
