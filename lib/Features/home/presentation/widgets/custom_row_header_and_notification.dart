import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomRowHeaderAndNotification extends StatelessWidget {
  const CustomRowHeaderAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                AppImages.onbarding1,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("مرحبا"),
                Text(
                  "كريم",
                  style: AppTextStyle.style16,
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration:
              BoxDecoration(color: AppColors.geryF, shape: BoxShape.circle),
          child: SvgPicture.asset(AppImages.notification),
        )
      ],
    );
  }
}
