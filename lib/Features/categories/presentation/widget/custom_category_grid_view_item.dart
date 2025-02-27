import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomCategoryGridViewItem extends StatelessWidget {
  final String image;
  final String title;
  const CustomCategoryGridViewItem(
      {super.key, required this.image, required this.title});

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
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Image.network(
                width: double.infinity,
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyle.style16,
          )
        ],
      ),
    );
  }
}
