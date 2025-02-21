import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_icon_container.dart';

class CustomHeaderAndIcon extends StatelessWidget {
  final String title;
  const CustomHeaderAndIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        width(0),
        Text(
          title,
          style: AppTextStyle.style20.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        CustomIconContainer(assetName: AppImages.arrow),
      ],
    );
  }
}
