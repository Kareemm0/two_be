import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_be/core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomProductListView extends StatelessWidget {
  final String image;
  final String categoryName;
  final String price;
  const CustomProductListView({
    super.key,
    required this.image,
    required this.categoryName,
    required this.price,
  });

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
    final String displayText = getFirstTwoWords(categoryName);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.geryF,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Flexible(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(image),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppImages.heart),
                ),
              ],
            ),
          ),
          Flexible(
            child: Text(
              displayText,
              style: AppTextStyle.style16,
              maxLines: 2, // Ensure text doesn't overflow
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              "$price\$",
              style:
                  AppTextStyle.style14.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
