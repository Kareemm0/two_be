import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';

InputBorder outLineInputBorder({
  Color? color,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? AppColors.secondaryColor,
    ),
  );
}
