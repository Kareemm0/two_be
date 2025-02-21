import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/core/utils/app_colors.dart';

class CustomIconContainer extends StatelessWidget {
  final String assetName;
  const CustomIconContainer({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.geryF, shape: BoxShape.circle),
      child: SvgPicture.asset(assetName),
    );
  }
}
