import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefixIconColor: AppColors.primaryColor,
        fillColor: AppColors.geryF,
        filled: true,
        prefixIcon: Icon(Icons.search),
        hintText: "بحث",
        hintStyle: AppTextStyle.style16.copyWith(color: AppColors.primaryColor),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.redED),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey8),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey8),
        ),
      ),
    );
  }
}
