import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomRowDivider extends StatelessWidget {
  final Color? textColor;
  const CustomRowDivider({super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Divider()),
        Expanded(
            child: FittedBox(
          child: Text(
            "او سجل عن طريق",
            style: AppTextStyle.style16
                .copyWith(color: textColor ?? AppColors.secondaryColor),
          ),
        )),
        Expanded(
            child: Divider(
          color: textColor ?? AppColors.secondaryColor,
        )),
      ],
    );
  }
}
