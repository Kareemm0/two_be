import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_text_style.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../../di.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../cubit/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt())..notification(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
        final cubit = context.read<NotificationCubit>();
        return Scaffold(
          body: state is NotificationLoading
              ? AimatedLoader(animation: AppImages.loading)
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: Column(
                    children: [
                      CustomHeaderAndIcon(title: "الاشعارات"),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.geryF,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    AppImages.logo,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                width(16),
                                Column(
                                  spacing: 8,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.notifications[index].title ?? "",
                                      style: AppTextStyle.style16.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                    Text(
                                        cubit.notifications[index].content ??
                                            "",
                                        style: AppTextStyle.style14),
                                  ],
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => height(16),
                          itemCount: cubit.notifications.length,
                        ),
                      )
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
