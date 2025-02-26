import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_social_media_buttons.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_text_form_filed.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/functions/validation.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/di.dart';
import '../../../../core/functions/show_toast.dart';
import '../widget/custom_auth_text.dart';
import '../widget/custom_row_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
                message: state.user.message!, backgroundColor: AppColors.green);
            context.pushReplacement(Routes.bottomNavigationBar);
          } else if (state is LoginFailedState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Expanded(child: Image.asset(AppImages.logo)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Form(
                      key: cubit.formKey,
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
                            validator: (valu) => AppValidation.emailValidator(
                                cubit.emailController.text),
                          ),
                          CustomTextFormFiled(
                            controller: cubit.passwordController,
                            hintText: "ادخل كلمة المرور الخاصة بك",
                            validator: (valu) => AppValidation.passwordVaildtor(
                                cubit.passwordController.text),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              "نسيت كلمة المرور؟",
                              style: AppTextStyle.style16
                                  .copyWith(color: AppColors.secondaryColor),
                            ).onTap(() {
                              context.push(Routes.forgetPasswordScreen);
                            }),
                          ),
                          CustomAppButton(
                            text: "تسجيل الدخول",
                            containerColor: AppColors.secondaryColor,
                            textColor: AppColors.primaryColor,
                            onPressed: () {
                              cubit.login();
                            },
                          ),
                          CustomAuthText(
                            isLoadgin: true,
                          ),
                          CustomRowDivider(),
                          CustomSocialMediaButtons()
                        ],
                      ),
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
