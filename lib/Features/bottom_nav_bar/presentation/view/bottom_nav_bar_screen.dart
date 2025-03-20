import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/bottom_nav_bar/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:two_be/Features/bottom_nav_bar/presentation/cubit/bottom_nav_bar_state.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final cubit = BottomNavBarCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              selectedItemColor: AppColors.primaryColor,
              // unselectedItemColor: AppColor.primaryColor,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              elevation: 0.0,
              selectedFontSize: 16,
              selectedIconTheme: IconThemeData(size: 30),
              unselectedIconTheme: IconThemeData(size: 24),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.home,
                    colorFilter: ColorFilter.mode(
                      cubit.currentIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.grey8,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "الرئيسيه",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.search,
                    colorFilter: ColorFilter.mode(
                      cubit.currentIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.grey8,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "بحث",
                ),
                BottomNavigationBarItem(
                  icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cartCubit = context.read<CartCubit>();
                      return Badge(
                        offset: Offset(-10, -10),
                        backgroundColor: AppColors.redED,
                        padding: const EdgeInsets.all(4),
                        textColor: AppColors.secondaryColor,
                        label: Text("${cartCubit.cart?.items?.length ?? 0}"),
                        child: SvgPicture.asset(
                          AppImages.cart,
                          colorFilter: ColorFilter.mode(
                            cubit.currentIndex == 2
                                ? AppColors.primaryColor
                                : AppColors.grey8,
                            BlendMode.srcIn,
                          ),
                        ),
                      );
                    },
                  ),
                  label: "العربه",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.profile,
                    colorFilter: ColorFilter.mode(
                        cubit.currentIndex == 3
                            ? AppColors.primaryColor
                            : AppColors.grey8,
                        BlendMode.srcIn),
                  ),
                  label: "الملف الشخصي",
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
