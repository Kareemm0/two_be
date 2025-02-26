import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomContryItemGridView extends StatelessWidget {
  final String flag;
  final String name;
  const CustomContryItemGridView({
    super.key,
    required this.flag,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(
            flag,
            fit: BoxFit.fill,
          ),
        ),
        height(6),
        Text(
          name,
          style: AppTextStyle.style16.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
