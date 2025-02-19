import 'package:flutter/widgets.dart';
import 'package:two_be/core/utils/app_sizes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_app_text.dart';

class CustomPageViewBody extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function()? onPressed;
  final String text;
  const CustomPageViewBody(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Image.asset(image)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.5),
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            spacing: 16,
            children: [
              Text(
                title,
                style: AppTextStyle.style20,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.style16.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              height(16),
              CustomAppButton(
                text: text,
                onPressed: onPressed,
                containerColor: AppColors.secondaryColor,
                textColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
