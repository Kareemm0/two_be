import 'package:flutter/material.dart';
import 'package:two_be/core/routes/app_router.dart';
import 'core/utils/app_style.dart';

class TwoBeApp extends StatelessWidget {
  const TwoBeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: appThemeData,
    );
  }
}
