import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/cart/presentation/widget/custom_order_sammery_details.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_icon_container.dart';
import 'package:two_be/di.dart';

import '../../../../core/cache/save_user_info.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_app_text.dart';
import '../../../Auth/Data/Model/user.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  User? _user;

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
      create: (context) => CartCubit(getIt()),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CreateOrderFailureState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  CustomHeaderAndIcon(title: "تاكيد الطلب"),
                  Row(
                    spacing: 16,
                    children: [
                      CustomIconContainer(assetName: AppImages.location),
                      Text("العنوان", style: AppTextStyle.style16),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      CustomIconContainer(assetName: AppImages.clock),
                      Text("الوقت", style: AppTextStyle.style16),
                    ],
                  ),
                  height(16),
                  CustomOrderSammeryDetails(),
                  Text("اختار طريقة الدفع", style: AppTextStyle.style16),
                  Row(
                    spacing: 16,
                    children: [
                      SvgPicture.asset(AppImages.pay),
                      Text(
                        "PayPal",
                        style: AppTextStyle.style16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      SvgPicture.asset(AppImages.cridte),
                      Text(
                        "Credit Card",
                        style: AppTextStyle.style16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      SvgPicture.asset(AppImages.cache),
                      Text(
                        "Cash",
                        style: AppTextStyle.style16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomAppButton(
                    text: "تأكيد الطلب",
                    onPressed: () {
                      cubit.createOrder(
                        context,
                        customerEmail: _user?.email ?? "",
                        customerName: _user?.username ?? "",
                      );
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
