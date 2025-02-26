import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';

import '../functions/out_line_input_border.dart';
import 'app_text_style.dart';

ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: "Cairo",
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextStyle.style14.copyWith(color: AppColors.primaryColor),
    errorBorder: outLineInputBorder(
      color: AppColors.redED,
    ),
    enabledBorder: outLineInputBorder(),
    focusedBorder: outLineInputBorder(),
    disabledBorder: outLineInputBorder(),
    focusedErrorBorder: outLineInputBorder(
      color: AppColors.redED,
    ),
    outlineBorder: const BorderSide(),
    activeIndicatorBorder: const BorderSide(),
  ),
);
