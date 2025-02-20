import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class CustomDotSlider extends StatelessWidget {
  const CustomDotSlider({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 5 : 1,
      width: 25,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
