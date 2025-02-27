import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/Features/home/presentation/widgets/custom_image_container.dart';
import 'package:two_be/Features/home/presentation/widgets/custom_row_text_category.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/di.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../widgets/custom_category_list_view.dart';
import '../widgets/custom_dotted_slider.dart';
import '../widgets/custom_row_header_and_notification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt())
        ..getCategory()
        ..startAutoSlide(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: state is HomeLoadingState
                ? AimatedLoader(
                    animation: AppImages.authLoader,
                  )
                : Column(
                    spacing: 16,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, top: 40, left: 16),
                        child: Column(
                          spacing: 16,
                          children: [
                            CustomRowHeaderAndNotification(),
                            CustomSearchBar(
                                controller: TextEditingController()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: PageView.builder(
                          onPageChanged: cubit.onPageChanged,
                          controller: cubit.pageController,
                          itemCount: cubit.imageUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomImageContainer(
                                image: cubit.imageUrls[index],
                              ),
                            );
                          },
                        ),
                      ),
                      CustomDottedSlider(
                        currentPage: cubit.currentPage,
                        imageLength: cubit.imageUrls.length,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height(16),
                                CustomRowTextCategory(
                                  text: "الاقسام",
                                  onTap: () {
                                    context.push(
                                      Routes.category,
                                      extra: cubit.categories,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 150,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomCategoryListView(
                                        categoryName:
                                            cubit.categories[index].name ?? "",
                                        image: cubit
                                                .categories[index].image?.src ??
                                            "",
                                      ).onTap(() {
                                        context.push(
                                          Routes.product,
                                          extra: cubit.categories[index].name,
                                        );
                                      });
                                    },
                                    separatorBuilder: (context, index) {
                                      return width(16);
                                    },
                                    itemCount: 10,
                                  ),
                                ),
                                height(16),
                                CustomRowTextCategory(
                                  text: "الاكثر مبيعا",
                                  onTap: () => context.push(Routes.product),
                                ),
                                SizedBox(
                                  height: 150,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomCategoryListView(
                                        categoryName: "ساعه",
                                        image:
                                            "https://www.almrsal.com/wp-content/uploads/2021/06/1-1.jpg",
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return width(16);
                                    },
                                    itemCount: cubit.categories.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
