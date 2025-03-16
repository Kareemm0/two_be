import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          spacing: 16,
          children: [
            CustomHeaderAndIcon(title: "سياسة الخصوصية"),
            Text(
              "نحن نحرص على حماية خصوصيتك. سياسة الخصوصية هذه توضح كيفية جمعنا واستخدامنا لمعلوماتك الشخصية. يرجى قراءة هذه السياسة بعناية.\n\n"
              "1. المعلومات التي نجمعها\n"
              "2. كيفية استخدام المعلومات\n"
              "3. مشاركة المعلومات مع أطراف ثالثة\n"
              "4. حماية المعلومات\n"
              "5. حقوق المستخدم",
              style: AppTextStyle.style16,
            ),
          ],
        ),
      ),
    );
  }
}
