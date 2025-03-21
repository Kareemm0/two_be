import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/core/utils/app_colors.dart';

class CustomIconContainer extends StatelessWidget {
  final String assetName;
  final Color? color;
  final void Function()? onpressed;

  const CustomIconContainer({
    super.key,
    required this.assetName,
    this.color,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration:
            BoxDecoration(color: AppColors.geryF, shape: BoxShape.circle),
        child: SvgPicture.asset(
          assetName,
          colorFilter: ColorFilter.mode(
              color ?? AppColors.primaryColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
