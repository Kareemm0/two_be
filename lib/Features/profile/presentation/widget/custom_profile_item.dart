import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProfileItem extends StatelessWidget {
  final String vector;
  final String name;
  final void Function()? onTap;
  const CustomProfileItem(
      {super.key, required this.vector, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.geryF,
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          vector,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          name,
          style: AppTextStyle.style16,
        ),
        onTap: onTap,
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
