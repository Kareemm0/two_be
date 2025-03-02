import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';

import '../../../../core/cache/save_user_info.dart';
import '../../../../core/service/on_boarding_service.dart';
import '../../../Auth/Data/Model/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isCentered = false;
  bool _isExpanded = false;
  User? _user;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    load();
  }

  Future<void> load() async {
    User? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
  }

  void _startAnimation() async {
    //! 500 ms delay before starting the animation
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isCentered = true;
    });

    //! 1 sec delay before expanding
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isExpanded = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    bool onboardingShown = await OnboardingService().isOnboardingShown();

    if (onboardingShown) {
      if (_user?.token == null) {
        context.pushReplacement(Routes.login);
      } else {
        context.pushReplacement(Routes.bottomNavigationBar);
      }
    } else {
      context.pushReplacement(Routes.onBoarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = widthSize(context);
    final screenHeight = heightSize(context);

    return Scaffold(
      backgroundColor:
          _isExpanded ? AppColors.primaryColor : AppColors.secondaryColor,
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        alignment: _isCentered ? Alignment.center : Alignment.centerLeft,
        color: _isExpanded ? AppColors.primaryColor : AppColors.secondaryColor,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: _isExpanded ? screenWidth : 100,
          height: _isExpanded ? screenHeight : 100,
          child: Image.asset(
            AppImages.logo,
            fit: _isExpanded ? BoxFit.fill : BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
