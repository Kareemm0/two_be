import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AimatedLoader extends StatelessWidget {
  final String animation;
  final double? height;
  final double? width;
  const AimatedLoader(
      {super.key, required this.animation, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          animation,
          height: height ?? 200,
          width: width ?? 200,
        ),
      ),
    );
  }
}
