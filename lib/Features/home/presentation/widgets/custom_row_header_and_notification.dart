import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_icon_container.dart';

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
        Image.asset(
          AppImages.logo,
          height: 50,
          width: 50,
        ),
        width(0),
        CustomIconContainer(
          assetName: AppImages.notification,
        ),
      ],
    );
  }
}
