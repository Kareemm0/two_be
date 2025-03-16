import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';

import '../../../../core/utils/app_text_style.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderAndIcon(title: "المساعدة"),
            Text(
              "كيفية إضافة منتج إلى السلة",
              style: AppTextStyle.style16,
            ),
            Text(
              "كيفية إتمام عملية الشراء",
              style: AppTextStyle.style16,
            ),
            Text(
              "كيفية تتبع الطلبات",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
