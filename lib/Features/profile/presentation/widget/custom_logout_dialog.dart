import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_app_text.dart';

class CustomLogoutDialog extends StatelessWidget {
  final void Function()? onPressed;
  const CustomLogoutDialog({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.secondaryColor,
      child: Container(
        height: heightSize(context) * .46,
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Image.asset(AppImages.logout),
            Text(
              "اوه لا ,انت تغادر",
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              "هل انت متاكد من تسجيل الخروج ؟",
              style: AppTextStyle.style14.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.redED,
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: CustomAppButton(
                    height: 48,
                    text: "لا",
                    onPressed: () => context.pop(),
                  ),
                ),
                Flexible(
                    child: CustomAppButton(
                  text: "نعم",
                  onPressed: onPressed,
                  containerColor: AppColors.redED,
                  height: 48,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
