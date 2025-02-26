import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomAuthText extends StatelessWidget {
  final bool isLoadgin;
  final Color? textColor;
  const CustomAuthText({super.key, required this.isLoadgin, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLoadgin ? "ليس لديك حساب ؟ " : "هل لديك حساب بالفعل ؟ ",
            style: AppTextStyle.style14.copyWith(
              color: textColor ?? AppColors.secondaryColor,
            )),
        Text(isLoadgin ? "سجل حساب جديد" : "قم بتسجيل الدخول",
            style: AppTextStyle.style16.copyWith(
              color: textColor ?? AppColors.secondaryColor,
              fontWeight: FontWeight.w700,
            )).onTap(() {
          isLoadgin
              ? context.push(Routes.register)
              : context.push(Routes.login);
        })
      ],
    );
  }
}
