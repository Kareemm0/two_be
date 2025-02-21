import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.geryF,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppImages.watch,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppImages.heart),
                    )
                  ],
                ),
                Column(
                  spacing: 16,
                  children: [
                    Text("ساعة", style: AppTextStyle.style16),
                    Text("بوما", style: AppTextStyle.style14),
                    Text(
                      "40\$",
                      style: AppTextStyle.style14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(AppImages.add)
          ],
        ));
  }
}
