import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.geryF,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Flexible(
            flex: 4,
            child: Stack(
              children: [
                Image.asset(AppImages.watch),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppImages.heart),
                )
              ],
            ),
          ),
          Flexible(child: Text("ساعة", style: AppTextStyle.style16)),
          Flexible(
            child: Text("40\$",
                style: AppTextStyle.style14
                    .copyWith(color: AppColors.primaryColor)),
          ),
        ],
      ),
    );
  }
}
