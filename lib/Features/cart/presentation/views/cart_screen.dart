import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widget/custom_delete_and_plus_and_minus.dart';

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
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.geryF,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ملخص الطلب",
                  style: AppTextStyle.style16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("القطع", style: AppTextStyle.style14),
                    Text("3", style: AppTextStyle.style14),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("المجموع قبل الخصم", style: AppTextStyle.style14),
                    Text("120\$", style: AppTextStyle.style14),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("الخصم", style: AppTextStyle.style14),
                    Text("4\$", style: AppTextStyle.style14),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مصاريف الشحن", style: AppTextStyle.style14),
                    Text("2\$", style: AppTextStyle.style14),
                  ],
                ),
                Divider(
                  color: AppColors.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("المجموع", style: AppTextStyle.style14),
                    Text("430\$", style: AppTextStyle.style14),
                  ],
                ),
              ],
            ),
          ),
          height(8),
          CustomAppButton(
            text: "تأكيد الطلب",
            onPressed: () {},
            radius: 30,
          ),
        ],
      ),
    ));
  }
}
