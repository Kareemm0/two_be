import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomDottedSlider extends StatelessWidget {
  final int currentPage;
  final int imageLength;
  const CustomDottedSlider({
    super.key,
    required this.currentPage,
    required this.imageLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageLength,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color:
                currentPage == index ? AppColors.primaryColor : AppColors.grey8,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
