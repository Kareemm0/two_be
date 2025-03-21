import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/Features/products/presentation/cubit/products_cubit.dart';
import 'package:two_be/Features/products/presentation/cubit/products_state.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/core/widgets/custom_icon_container.dart';
import 'package:two_be/di.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../widget/custom_product_name_and_review.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int id;
  const ProductsDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt())..getProductsDetails(id: id.toString()),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final cubit = context.read<ProductsCubit>();

          return Scaffold(
            body: state is ProductsLoadingState
                ? Center(
                    child: AimatedLoader(animation: AppImages.loading),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: heightSize(context) * .4,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cubit.productDetailsById
                                                ?.images?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            width: widthSize(context),
                                            child: Image.network(
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                cubit.productDetailsById
                                                        ?.images?[index].src ??
                                                    ""),
                                          );
                                        }),
                                  ),
                                  BlocBuilder<HomeCubit, HomeState>(
                                    builder: (context, state) {
                                      final cubit = context.read<HomeCubit>();
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomIconContainer(
                                              assetName: AppImages.heart,
                                              color: cubit.favoriteList
                                                          .contains(
                                                              id.toString()) ==
                                                      true
                                                  ? AppColors.redED
                                                  : AppColors.primaryColor,
                                              onpressed: () {
                                                cubit.favorite(
                                                    productId: id.toString());
                                              },
                                            ),
                                            CustomIconContainer(
                                                    color:
                                                        AppColors.primaryColor,
                                                    assetName: AppImages.arrow)
                                                .onTap(() {
                                              context.pop();
                                            }),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomProductNameAndReview(
                                      productName:
                                          cubit.productDetailsById?.name ?? "",
                                      review: cubit.productDetailsById
                                              ?.ratingCount ??
                                          0,
                                    ),
                                    height(12),
                                    Text(
                                      "الوصف",
                                      style: AppTextStyle.style16.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    height(8),
                                    Text(
                                      cubit.productDetailsById?.description ??
                                          "",
                                      style: AppTextStyle.style14.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Fixed Button Section
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: BlocConsumer<CartCubit, CartState>(
                          listener: (context, state) {
                            if (state is AddToCartSuccessState) {
                              showToast(
                                  message: state.message,
                                  backgroundColor: AppColors.green);
                              context
                                  .pushReplacement(Routes.bottomNavigationBar);
                            } else if (state is AddToCartFailureState) {
                              showToast(
                                  message: state.message,
                                  backgroundColor: AppColors.redED);
                            }
                          },
                          builder: (context, state) {
                            cubit.mfApplePayButton = MFApplePayButton(
                                applePayStyle: MFApplePayStyle());

                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CustomAppButton(
                                        text: "اضافة للسلة",
                                        radius: 30,
                                        onPressed: () => context
                                            .read<CartCubit>()
                                          ..addToCart(productId: id.toString()),
                                      ),
                                    ),
                                    width(16),
                                    SvgPicture.asset(
                                      AppImages.cart,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ],
                                ),
                                Platform.isIOS == true
                                    ? SizedBox(
                                        height: 50,
                                        child: cubit.mfApplePayButton,
                                      ).onTap(() {
                                        cubit.applePayPayment();
                                      })
                                    : Container(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
