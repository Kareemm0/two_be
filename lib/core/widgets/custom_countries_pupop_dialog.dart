import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_sizes.dart';

popupDropDownDialogs({
  required BuildContext context,
  required List<Widget> children,
  String? hintText,
  String? value,
}) {
  showDialog(
    context: context,
    builder: ((context) {
      return (Dialog(
        child: Container(
          height: heightSize(context) * .7,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }),
  );
}
