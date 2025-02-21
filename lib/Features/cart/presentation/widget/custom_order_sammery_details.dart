import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomOrderSammeryDetails extends StatelessWidget {
  const CustomOrderSammeryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
