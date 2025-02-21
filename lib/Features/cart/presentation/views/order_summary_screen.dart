import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/Features/cart/presentation/widget/custom_order_sammery_details.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_icon_container.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_app_text.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
