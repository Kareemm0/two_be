import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isCentered = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
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

  void _navigateToLogin() {
    context.pushReplacement(Routes.onBoarding);
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
