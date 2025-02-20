import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_social_media_buttons.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_text_form_filed.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_row_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Expanded(child: Image.asset(AppImages.logo)),
                  Container(
                    padding: EdgeInsets.all(8),
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
                        Text(
                          "مرحبا مجددا",
                          style: AppTextStyle.style20,
                        ),
                        Text(
                          "من فضلك قم بتسجيل الدخول",
                          style: AppTextStyle.style16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        CustomTextFormFiled(
                          controller: cubit.emailController,
                          hintText: "ادخل البريد الالكتروني الخاص بك",
                        ),
                        CustomTextFormFiled(
                          controller: cubit.emailController,
                          hintText: "ادخل كلمة المرور الخاصة بك",
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            "نسيت كلمة المرور؟",
                            style: AppTextStyle.style16
                                .copyWith(color: AppColors.redED),
                          ),
                        ),
                        CustomAppButton(
                          text: "تسجيل الدخول",
                          containerColor: AppColors.secondaryColor,
                          textColor: AppColors.primaryColor,
                        ),
                        CustomAuthText(
                          isLoadgin: true,
                        ),
                        CustomRowDivider(),
                        CustomSocialMediaButtons()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
