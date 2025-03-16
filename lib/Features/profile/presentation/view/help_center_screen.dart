import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';

import '../../../../core/utils/app_text_style.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderAndIcon(title: "مركز المساعدة"),
            Text(
              "الأسئلة الشائعة:",
              style: AppTextStyle.style16,
            ),
            Text(
              "- كيف يمكنني إعادة منتج؟",
              style: AppTextStyle.style16,
            ),
            Text(
              "- كيف يمكنني تغيير عنوان الشحن؟",
              style: AppTextStyle.style16,
            ),
            Text(
              "- كيف يمكنني الاتصال بدعم العملاء؟",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
