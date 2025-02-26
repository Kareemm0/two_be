import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/utils/app_text_style.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/custom_image_picker_dialog.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Row(
          children: [
            DottedBorder(
              strokeWidth: 2,
              color: AppColors.primaryColor,
              borderType: BorderType.Circle,
              dashPattern: const [8, 4],
              child: SizedBox(
                width: 100,
                height: 100,
                child: cubit.profileImage == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profilePic),
                      )
                    : CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        backgroundImage: FileImage(cubit.profileImage!),
                      ),
              ),
            ),
            width(12),
            Text(
              "اضف صورة",
              style: AppTextStyle.style16.copyWith(
                color: AppColors.primaryColor,
              ),
            ).onTap(() {
              showImagePickerDialog(
                context,
                cameraOnTap: () {
                  cubit.logoPicker(ImageSource.camera);
                  context.pop();
                },
                galleryOnTap: () {
                  cubit.logoPicker(ImageSource.gallery);
                  context.pop();
                },
                peaperText: "اختر صورة ملفك الشخصي",
              );
            }),
          ],
        );
      },
    );
  }
}
