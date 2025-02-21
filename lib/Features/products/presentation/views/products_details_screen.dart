import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/widgets/custom_app_text.dart';
import 'package:two_be/core/widgets/custom_icon_container.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widget/custom_product_name_and_review.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                width: double.infinity,
                fit: BoxFit.fill,
                AppImages.shoos,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconContainer(assetName: AppImages.heart),
                    CustomIconContainer(assetName: AppImages.arrow),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductNameAndReview(),
                Text(
                  "الوصف",
                  style: AppTextStyle.style16.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "ذنب أو مسؤولية تنجم عن الحقيقة في مواجهة الحقيقة، بحضور النعم في أوقاتنا. إرادة الطبيب سهلة ولكنها ليست كذلك. إنه تحقيق سريع يحدث للحقائق والأشياء. مزعج لأنه في مكان لا أحد فيه. نحن نمدح أولئك الذين لا يعرفون كيفية اختيار ذلك.",
                  style: AppTextStyle.style14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              spacing: 16,
              children: [
                Flexible(
                  child: CustomAppButton(
                    text: "شراء الان",
                    radius: 30,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.cart,
                  width: 40,
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
