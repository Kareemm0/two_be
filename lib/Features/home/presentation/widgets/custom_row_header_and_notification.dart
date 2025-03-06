import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_icon_container.dart';

class CustomRowHeaderAndNotification extends StatelessWidget {
  final String name;
  final String image;
  const CustomRowHeaderAndNotification(
      {super.key, required this.name, required this.image});

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
              backgroundImage: NetworkImage(image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("مرحبا"),
                Text(
                  name,
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
        ).onTap(() {
          context.push(Routes.notificationScreen);
        }),
      ],
    );
  }
}
