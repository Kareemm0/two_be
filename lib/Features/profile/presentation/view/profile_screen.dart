import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:two_be/Features/profile/presentation/widget/custom_logout_dialog.dart';
import 'package:two_be/Features/profile/presentation/widget/custom_profile_item.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import 'package:two_be/di.dart';
import '../../../../core/cache/save_user_info.dart';
import '../../../Auth/Data/Model/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

User? _user;

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> load() async {
    User? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.username}");
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
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            showToast(message: state.message, backgroundColor: AppColors.green);
            context.pushReplacement(Routes.login);
          } else if (state is LogoutFailedState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_user?.avatar ?? ""),
                  ),
                  Text(
                    _user?.username ?? "",
                    style: AppTextStyle.style16,
                  ),
                  ...List.generate(
                      cubit.profileIcon.length,
                      (index) => CustomProfileItem(
                            vector: cubit.profileIcon[index],
                            name: cubit.profile[index],
                            onTap: () {
                              context.push(cubit.routes[index]);
                            },
                          )),
                  height(30),
                  Text(
                    "تسجيل الخروج",
                    style:
                        AppTextStyle.style20.copyWith(color: AppColors.redED),
                  ).onTap(() {
                    showDialog(
                        context: context,
                        builder: (context) => CustomLogoutDialog(
                              onPressed: () => cubit.logout(),
                            ));
                  }),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
