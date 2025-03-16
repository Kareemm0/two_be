import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/core/extension/extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomDeleteAndPlusAndMinus extends StatelessWidget {
  const CustomDeleteAndPlusAndMinus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 16,
          children: [
            SvgPicture.asset(AppImages.delete),
            Row(
              spacing: 8,
              children: [
                SvgPicture.asset(
                  AppImages.minus,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ).onTap(() {
                  cubit.decrementItemCounter();
                }),
                Text(
                  cubit.itemCounter.toString(),
                  style: AppTextStyle.style16
                      .copyWith(color: AppColors.primaryColor),
                ),
                SvgPicture.asset(
                  AppImages.plus,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ).onTap(() {
                  cubit.incrementItemCounter();
                }),
              ],
            )
          ],
        );
      },
    );
  }
}
