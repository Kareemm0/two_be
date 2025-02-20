import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Divider()),
        Expanded(
            child: Text(
          "او سجل عن طريق",
          style: AppTextStyle.style16.copyWith(color: AppColors.secondaryColor),
        )),
        Expanded(child: Divider()),
      ],
    );
  }
}
