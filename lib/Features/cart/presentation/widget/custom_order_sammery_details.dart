import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomOrderSammeryDetails extends StatelessWidget {
  final int quantity;
  final String total;
  const CustomOrderSammeryDetails(
      {super.key, required this.quantity, required this.total});

  @override
  Widget build(BuildContext context) {
    double totalValue = double.parse(total);
    double finalTotal = totalValue * quantity;
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
              Text(quantity.toString(), style: AppTextStyle.style14),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الاسعار تشمل ضربية القيمه المضافه 15%",
                  style: AppTextStyle.style14),
            ],
          ),
          Divider(
            color: AppColors.primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("المجموع", style: AppTextStyle.style14),
              Text("${finalTotal.toStringAsFixed(2)} SAR",
                  style: AppTextStyle.style14),
            ],
          ),
        ],
      ),
    );
  }
}
