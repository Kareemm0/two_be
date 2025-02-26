import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_text_form_filed.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/functions/validation.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/di.dart';

import '../../../../core/routes/routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            context.pushReplacement(Routes.login);
            showToast(message: state.message, backgroundColor: AppColors.green);
          } else if (state is ForgetPasswordFailureState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomHeaderAndIcon(title: "نسيت كلمة المرور"),
                    height(50),
                    CustomTextFormFiled(
                      controller: cubit.emailController,
                      hintText: "ادخل البريد الالكتروني",
                      hintColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      errorColor: AppColors.redED,
                      textInputColor: AppColors.primaryColor,
                      validator: (val) {
                        return AppValidation.emailValidator(
                            cubit.emailController.text);
                      },
                    ),
                    Spacer(),
                    CustomAppButton(
                      text: "ارسال",
                      onPressed: () {
                        cubit.forgetPassword();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
