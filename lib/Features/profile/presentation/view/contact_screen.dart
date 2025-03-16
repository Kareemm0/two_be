import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';

import '../../../../core/utils/app_text_style.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderAndIcon(title: "اتصل بنا"),
            Text(
              "البريد الإلكتروني: support@ecommerce.com",
              style: AppTextStyle.style16,
            ),
            Text(
              "الهاتف: +966 500 000 000",
              style: AppTextStyle.style16,
            ),
            Text(
              "العنوان: الرياض، المملكة العربية السعودية",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
