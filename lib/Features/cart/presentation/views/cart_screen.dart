import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/cart/presentation/widget/custom_cart_item.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/di.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../widget/custom_order_sammery_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt())..getCart(),
      child: BlocBuilder<CartCubit, CartState>(
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
                                image: cubit.cart?.items?[index].images?[index]
                                            .src?.isNotEmpty ==
                                        true
                                    ? cubit.cart?.items![index].images![index]
                                            .src ??
                                        ""
                                    : "",
                                name: cubit.cart?.items?[index].name ?? "",
                                price:
                                    cubit.cart?.items?[index].prices?.price ??
                                        "",
                              ),
                              separatorBuilder: (context, index) => height(16),
                              itemCount: cubit.cart?.items?.length ?? 0,
                            ),
                          ),
                          CustomOrderSammeryDetails(),
                          height(8),
                          CustomAppButton(
                            text: "تأكيد الطلب",
                            onPressed: () {
                              context.push(Routes.orderSummary);
                            },
                            radius: 30,
                          ),
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}
