import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomCategoryGridViewItem extends StatelessWidget {
  const CustomCategoryGridViewItem({super.key});

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
            child: Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  AppImages.shoos,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppImages.heart),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("ساعة", style: AppTextStyle.style16),
                  Text(
                    "40\$",
                    style: AppTextStyle.style14
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),
              SvgPicture.asset(AppImages.add)
            ],
          )
        ],
      ),
    );
  }
}
