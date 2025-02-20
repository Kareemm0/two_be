import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DottedBorder(
          strokeWidth: 2,
          color: AppColors.secondaryColor,
          borderType: BorderType.Circle,
          dashPattern: const [8, 4],
          child: SizedBox(
            width: 100,
            height: 100,
            child: File('') == null
                ? const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    backgroundImage: FileImage(File('')),
                  ),
          ),
        ),
        width(12),
        Text(
          "اضف صورة",
          style: AppTextStyle.style16.copyWith(
            color: AppColors.secondaryColor,
          ),
        ).onTap(() {
          // showImagePickerDialog(
          //   context,
          //   cameraOnTap: () {
          //     cubit.logoPicker(ImageSource.camera);
          //     context.pop();
          //   },
          //   galleryOnTap: () {
          //     cubit.logoPicker(ImageSource.gallery);
          //     context.pop();
          //   },
          //   peaperText: "أضف صورة مركز الصيانة",
          // );
        }),
      ],
    );
  }
}
