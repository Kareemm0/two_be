import 'package:flutter/material.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';

void showImagePickerDialog(
  BuildContext ctx, {
  required void Function()? cameraOnTap,
  required void Function()? galleryOnTap,
  required String peaperText,
}) {
  showDialog(
    context: ctx,
    builder: (ctx) {
      return Dialog(
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            height: heightSize(ctx) * 0.25,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  peaperText,
                  style: AppTextStyle.style16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                height(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                          size: 32,
                          color: AppColors.primaryColor,
                        ),
                        height(4),
                        Text(
                          "معرض الصور",
                          style: AppTextStyle.style14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ).onTap(galleryOnTap),
                    Column(
                      children: [
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 32,
                          color: AppColors.primaryColor,
                        ),
                        height(4),
                        Text(
                          "الكاميرا",
                          style: AppTextStyle.style14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ).onTap(cameraOnTap),
                  ],
                )
              ],
            )),
      );
    },
  );
}
