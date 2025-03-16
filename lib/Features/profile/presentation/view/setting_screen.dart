import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/utils/app_text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderAndIcon(title: "الاعدادات"),
            Text(
              "إعدادات الحساب",
              style: AppTextStyle.style16,
            ),
            Text(
              "إعدادات الإشعارات",
              style: AppTextStyle.style16,
            ),
            Text(
              "إعدادات اللغة",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
