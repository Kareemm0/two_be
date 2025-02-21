import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widget/custom_delete_and_plus_and_minus.dart';
import '../widget/custom_order_sammery_details.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          CustomHeaderAndIcon(title: "السلة"),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.geryF,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            Image.asset(AppImages.watch),
                            Column(
                              spacing: 16,
                              children: [
                                Text("ساعة", style: AppTextStyle.style16),
                                Text("بوما", style: AppTextStyle.style14),
                                Text(
                                  "40\$",
                                  style: AppTextStyle.style14
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomDeleteAndPlusAndMinus(),
                      ],
                    )),
                separatorBuilder: (context, index) => height(16),
                itemCount: 3),
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
  }
}
