import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import 'custom_delete_and_plus_and_minus.dart';

class CustomCartItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const CustomCartItem(
      {super.key,
      required this.image,
      required this.name,
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
            Row(
              spacing: 16,
              children: [
                Image.network(image),
                Column(
                  spacing: 16,
                  children: [
                    Text(name, style: AppTextStyle.style16),
                    Text(
                      "$price\$",
                      style: AppTextStyle.style14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            CustomDeleteAndPlusAndMinus(),
          ],
        ));
  }
}
