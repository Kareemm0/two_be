import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/functions/show_toast.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String productId;
  const CustomProductItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.geryF,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                spacing: 16,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        width: 100,
                        height: 100,
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          final cubit = context.read<HomeCubit>();
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              AppImages.heart,
                              colorFilter: ColorFilter.mode(
                                cubit.favoriteList
                                            .contains(productId.toString()) ==
                                        true
                                    ? AppColors.redED
                                    : AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ).onTap(() {
                              cubit.favorite(productId: productId);
                            }),
                          );
                        },
                      )
                    ],
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(title, style: AppTextStyle.style16),
                        Text(
                          "$price SAR",
                          style: AppTextStyle.style14
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is AddToCartSuccessState) {
                  showToast(
                      message: state.message, backgroundColor: AppColors.green);
                } else if (state is AddToCartFailureState) {
                  showToast(
                      message: state.message, backgroundColor: AppColors.redED);
                }
              },
              builder: (context, state) {
                final cubit = context.read<CartCubit>();
                return SvgPicture.asset(AppImages.add).onTap(() {
                  cubit.addToCart(productId: productId);
                });
              },
            )
          ],
        ));
  }
}
