import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/onBoarding/presentation/widgets/custom_page_view_body.dart';
import '../../../../core/routes/routes.dart';
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
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomVisibleSkipButton(
              pageController: pageController,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) => CustomPageViewBody(
                  listLength: onBoarding.length,
                  pageindex: index,
                  image: onBoarding[index].image,
                  title: onBoarding[index].title,
                  description: onBoarding[index].description,
                  text: index == onBoarding.length - 1 ? "انهاء" : "التالي",
                  onPressed: () async {
                    if (pageController.hasClients) {
                      if (pageController.page!.toInt() ==
                          onBoarding.length - 1) {
                        context.pushReplacement(Routes.login);
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  },
                ),
                itemCount: onBoarding.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
