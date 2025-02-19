import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomVisibleSkipButton extends StatelessWidget {
  const CustomVisibleSkipButton({
    super.key,
    required this.pageController,
    this.onTap,
  });

  final PageController pageController;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: pageController.hasClients
          ? (pageController.page == 3 ? false : true)
          : true,
      child: TextButton(
        onPressed: () async {
          //  await OnboardingService().markOnboardingAsShown();
          log("OnBording Status Save");
          context.pushReplacement(Routes.login);
        },
        child: Text(
          "تخطي",
          style: AppTextStyle.style16,
        ),
      ),
    );
  }
}
