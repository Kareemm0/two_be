import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/utils/app_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImages.watch),
                ),
                Text(
                  "كريم ",
                  style: AppTextStyle.style16,
                ),
                ...List.generate(
                  cubit.profileIcon.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.geryF,
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        cubit.profileIcon[index],
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Text(
                        cubit.profile[index],
                        style: AppTextStyle.style16,
                      ),
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                height(30),
                Text(
                  "تسجيل الخروج",
                  style: AppTextStyle.style20.copyWith(color: AppColors.redED),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
