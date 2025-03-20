import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/di.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../../core/widgets/custom_app_text.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../cubit/cart_cubit.dart';
import '../widget/custom_cart_item.dart';
import '../widget/custom_order_sammery_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isUpdating = false; // Flag to prevent multiple clicks

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt())..getCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is DeleteItemFromCartSuccessState) {
            context.read<CartCubit>().getCart();
            showToast(message: state.message, backgroundColor: AppColors.green);
          } else if (state is DeleteItemFromCartFailureState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();

          return Scaffold(
            body: state is AddToCartLoadingState
                ? AimatedLoader(animation: AppImages.loading)
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      children: [
                        CustomHeaderAndIcon(title: "السلة"),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => CustomCartItem(
                              deleteTap: () {
                                cubit.deleteItemFromCart(
                                    productKey:
                                        cubit.cart?.items?[index].key ?? "");
                              },
                              image: cubit.cart?.items?[index].images
                                          ?.isNotEmpty ==
                                      true
                                  ? cubit.cart?.items![index].images![0].src ??
                                      ""
                                  : "",
                              name: cubit.cart?.items?[index].name ?? "",
                              price:
                                  cubit.cart?.items?[index].prices?.price ?? "",
                              quantity: cubit.cart?.items?[index].quantity ?? 0,
                              onIncrement: () {
                                if (!_isUpdating) {
                                  _isUpdating = true; // Set flag to true
                                  log("increment $index");
                                  cubit.updateItemQuantity(
                                      index,
                                      (cubit.cart?.items?[index].quantity ??
                                              0) +
                                          1);
                                  Future.delayed(Duration(milliseconds: 300),
                                      () {
                                    _isUpdating = false;
                                  });
                                }
                              },
                              onDecrement: () {
                                if (!_isUpdating) {
                                  _isUpdating = true;
                                  log("decrement $index");
                                  if ((cubit.cart?.items?[index].quantity ??
                                          0) >
                                      0) {
                                    cubit.updateItemQuantity(
                                        index,
                                        (cubit.cart?.items?[index].quantity ??
                                                0) -
                                            1);
                                  }
                                  Future.delayed(Duration(milliseconds: 300),
                                      () {
                                    _isUpdating = false;
                                  });
                                }
                              },
                            ),
                            separatorBuilder: (context, index) => height(16),
                            itemCount: cubit.cart?.items?.length ?? 0,
                          ),
                        ),
                        CustomOrderSammeryDetails(
                          quantity: cubit.totalQuantity,
                          total: cubit.totalPrice.toStringAsFixed(2),
                        ),
                        height(8),
                        CustomAppButton(
                          text: " اذهب الي الدفع",
                          onPressed: () {
                            context.push(Routes.orderSummary);
                          },
                          radius: 30,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
