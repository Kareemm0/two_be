import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Core/utils/app_colors.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_auth_text.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_row_divider.dart';
import 'package:two_be/Features/Auth/presentation/widget/custom_social_media_buttons.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/functions/validation.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/core/widgets/custom_countries_pupop_dialog.dart';
import 'package:two_be/di.dart';
import '../widget/custom_contry_item_grid_view.dart';
import '../widget/custom_image_container.dart';
import '../widget/custom_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt())..getCountries(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(
              message: state.user.message!,
              backgroundColor: AppColors.green,
            );

            context.pushReplacement(Routes.bottomNavigationBar);
          } else if (state is RegisterFailedState) {
            showToast(
              message: state.message,
              backgroundColor: AppColors.redED,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          spacing: 16,
                          children: [
                            CustomAddImage(),
                            //! User Name
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              controller: cubit.usernameController,
                              borderColor: AppColors.primaryColor,
                              hintText: "ادخل  الاسم الخاص بك",
                              validator: (val) =>
                                  AppValidation.displayNameValidator(
                                cubit.usernameController.text,
                              ),
                            ),
                            //! Email
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              controller: cubit.emailController,
                              borderColor: AppColors.primaryColor,
                              hintText: "ادخل البريد الالكتروني الخاص بك",
                              validator: (val) => AppValidation.emailValidator(
                                cubit.emailController.text,
                              ),
                            ),
                            //! Phone
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              controller: cubit.phoneController,
                              hintText: "ادخل رقم الهاتف الخاص بك",
                              validator: (val) =>
                                  AppValidation.phoneNumberVaildtor(
                                cubit.phoneController.text,
                              ),
                            ),
                            //! Country
                            CustomTextFormFiled(
                              hintColor: AppColors.primaryColor,
                              controller: TextEditingController(),
                              borderColor: AppColors.primaryColor,
                              hintText: cubit.selectedItem == ""
                                  ? "اختار بلدك"
                                  : cubit.selectedItem,
                              enabled: false,
                            ).onTap(
                              () {
                                popupDropDownDialogs(
                                    context: context,
                                    children: [
                                      SizedBox(
                                        height: heightSize(context) * 0.7,
                                        width: double.maxFinite,
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            return CustomContryItemGridView(
                                              flag:
                                                  cubit.countries[index].flag ??
                                                      "",
                                              name:
                                                  cubit.countries[index].name ??
                                                      "",
                                            ).onTap(() {
                                              setState(() {
                                                cubit.selectedItem = cubit
                                                    .countries[index].name!;
                                              });
                                              context.pop();
                                            });
                                          },
                                          itemCount: cubit.countries.length,
                                        ),
                                      )
                                    ]);
                              },
                            ),
                            //! Password
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              controller: cubit.passwordController,
                              hintText: "ادخل كلمة المرور الخاص بك",
                              validator: (val) =>
                                  AppValidation.passwordVaildtor(
                                cubit.passwordController.text,
                              ),
                            ),
                            //! Confirm Password
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              controller: cubit.confirmPasswordController,
                              hintText: "اعد ادخال كلمة المرور الخاصة بك",
                              validator: (val) =>
                                  AppValidation.confirmPasswordVaildtor(
                                password: cubit.passwordController.text,
                                value: cubit.confirmPasswordController.text,
                              ),
                            ),
                            CustomAppButton(
                              text: "تسجيل",
                              containerColor: AppColors.primaryColor,
                              textColor: AppColors.secondaryColor,
                              onPressed: () {
                                cubit.register();
                              },
                            ),
                            CustomAuthText(
                              isLoadgin: false,
                              textColor: AppColors.primaryColor,
                            ),
                            CustomRowDivider(
                              textColor: AppColors.primaryColor,
                            ),
                            CustomSocialMediaButtons(
                              borderColor: AppColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
