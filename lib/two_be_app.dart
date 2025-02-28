import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:two_be/core/routes/app_router.dart';
import 'core/constant/providers_list.dart';
import 'core/utils/app_style.dart';

class TwoBeApp extends StatelessWidget {
  const TwoBeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRootProvider(
      child: MaterialApp.router(
        locale: Locale('ar'),
        supportedLocales: [
          const Locale('ar'),
        ],
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: appThemeData,
      ),
    );
  }
}
