import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
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
                                  Image.network(
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    cubit.productDetailsById?.images?.first
                                            .src ??
                                        "",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomIconContainer(
                                            assetName: AppImages.heart),
                                        CustomIconContainer(
                                                assetName: AppImages.arrow)
                                            .onTap(() {
                                          context.pop();
                                        }),
                                      ],
                                    ),
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
                                    const SizedBox(height: 12),
                                    Text(
                                      "الوصف",
                                      style: AppTextStyle.style16.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
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
                              context.push(Routes.bottomNavigationBar);
                            } else if (state is AddToCartFailureState) {
                              showToast(
                                  message: state.message,
                                  backgroundColor: AppColors.redED);
                            }
                          },
                          builder: (context, state) {
                            return Row(
                              children: [
                                Expanded(
                                  child: CustomAppButton(
                                    text: "اضافة للسلة",
                                    radius: 30,
                                    onPressed: () => context.read<CartCubit>()
                                      ..addToCart(productId: id.toString()),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset(
                                  AppImages.cart,
                                  width: 40,
                                  height: 40,
                                ),
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
