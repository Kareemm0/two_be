import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderAndIcon(title: "حول التطبيق"),
            Text(
              "اسم التطبيق: متجر إلكتروني",
              style: AppTextStyle.style16,
            ),
            Text(
              "الإصدار: 1.0.0",
              style: AppTextStyle.style16,
            ),
            Text(
              "متجر توبي يضم أكثر من 3500 منتج لاشهر البراندات العالمية",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
