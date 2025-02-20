import 'package:flutter/material.dart';
import 'package:two_be/Core/utils/app_colors.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_auth_text.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_row_divider.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_social_media_buttons.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';

import '../../../../core/utils/app_images.dart';
import '../widget/custom_image_container.dart';
import '../widget/custom_text_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Expanded(child: Image.asset(AppImages.logo)),
              height(16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    CustomAddImage(),
                    CustomTextFormFiled(
                      controller: TextEditingController(),
                      hintText: "ادخل البريد الالكتروني الخاص بك",
                    ),
                    CustomTextFormFiled(
                      controller: TextEditingController(),
                      hintText: "ادخل رقم الهاتف الخاص بك",
                    ),
                    CustomTextFormFiled(
                      controller: TextEditingController(),
                      hintText: "ادخل كلمة المرور الخاص بك",
                    ),
                    CustomTextFormFiled(
                      controller: TextEditingController(),
                      hintText: "اعد ادخال كلمة المرور الخاصة بك",
                    ),
                    CustomAppButton(
                      text: "تسجيل",
                      containerColor: AppColors.secondaryColor,
                      textColor: AppColors.primaryColor,
                    ),
                    CustomAuthText(isLoadgin: false),
                    CustomRowDivider(),
                    CustomSocialMediaButtons()
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
