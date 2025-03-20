import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import 'custom_delete_and_plus_and_minus.dart';

class CustomCartItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final void Function()? onIncrement;
  final void Function()? onDecrement;
  final void Function()? deleteTap;
  final int quantity;
  const CustomCartItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      this.onIncrement,
      this.onDecrement,
      required this.quantity,
      this.deleteTap});

  String getFirstTwoWords(String text) {
    List<String> words = text.split(' ');
    if (words.length > 3) {
      return '${words[0]} ${words[1]} ${words[2]}';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = getFirstTwoWords(name);

    return Container(
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.geryF,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16,
              children: [
                Image.network(
                  image,
                  height: 100,
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(displayText, style: AppTextStyle.style16),
                    Text(
                      "$price SAR",
                      style: AppTextStyle.style14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            CustomDeleteAndPlusAndMinus(
              onDecrement: onDecrement,
              onIncrement: onIncrement,
              quantity: quantity,
              deleteTap: deleteTap,
            ),
          ],
        ));
  }
}
