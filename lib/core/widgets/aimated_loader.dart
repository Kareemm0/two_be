import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AimatedLoader extends StatelessWidget {
  final String animation;
  const AimatedLoader({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          animation,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
