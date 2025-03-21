import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const CustomProductItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price});

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
            Flexible(
              child: Row(
                spacing: 16,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        width: 100,
                        height: 100,
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppImages.heart),
                      )
                    ],
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(title, style: AppTextStyle.style16),
                        Text(
                          "$price SAR",
                          style: AppTextStyle.style14
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(AppImages.add)
          ],
        ));
  }
}
