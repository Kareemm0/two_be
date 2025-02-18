import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/on_baording_model.dart';
import '../widgets/custom_skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomVisibleSkipButton(
            pageController: pageController,
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    onBoarding[index].title,
                    style: AppTextStyle.style16,
                  ),
                  Image.asset(onBoarding[index].image),
                  Text(
                    onBoarding[index].description,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.style16,
                  ),
                ],
              ),
              itemCount: onBoarding.length,
            ),
          ),
          height(64),
          // CustomButtonsRow(
          //   pageController: pageController,
          // ),
        ],
      ),
    ));
  }
}
