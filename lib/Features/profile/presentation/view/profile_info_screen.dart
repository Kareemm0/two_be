import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/di.dart';
import '../../../../core/cache/save_user_info.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/custom_app_text.dart';
import '../../../../core/widgets/custom_countries_pupop_dialog.dart';
import '../../../Auth/Data/Model/user.dart';
import '../../../Auth/presentation/widget/custom_contry_item_grid_view.dart';
import '../../../Auth/presentation/widget/custom_text_form_filed.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  User? _user;

  Future<void> load() async {
    User? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user?.username}");
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt()),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      CustomHeaderAndIcon(title: "الملف الشخصي"),
                      height(32),
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(_user?.avatar ?? ""),
                              ),
                            ),
                            //! User Name
                            CustomTextFormFiled(
                              textInputColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              controller: cubit.usernameController,
                              borderColor: AppColors.primaryColor,
                              hintText: _user?.username ?? "",
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
                              hintText: _user?.email ?? "",
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
                              hintText: _user?.phone ?? "",
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
                                  ? _user?.country ?? ""
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

                            CustomAppButton(
                              text: "تحديث البيانات",
                              containerColor: AppColors.primaryColor,
                              textColor: AppColors.secondaryColor,
                              onPressed: () {
                                //cubit.register();
                              },
                            ),
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
