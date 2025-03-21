import 'package:flutter/material.dart';
import 'package:two_be/core/utils/app_colors.dart';

class CustomChoocsePaymentContainer extends StatelessWidget {
  final String image;
  final bool isChoose;

  const CustomChoocsePaymentContainer(
      {super.key, required this.image, this.isChoose = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor,
        shadows: [
          BoxShadow(
            color: isChoose ? AppColors.primaryColor : AppColors.secondaryColor,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isChoose ? AppColors.primaryColor : AppColors.grey8,
            )),
      ),
      duration: Duration(seconds: 1),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            image,
            height: 60,
            width: 60,
          ),
        ),
      ),
    );
  }
}
