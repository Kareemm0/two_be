import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/Features/home/presentation/widgets/custom_image_container.dart';
import 'package:two_be/Features/home/presentation/widgets/custom_row_text_category.dart';
import 'package:two_be/Features/products/presentation/cubit/products_cubit.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/di.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../products/data/Model/products_model/products_model.dart';
import '../widgets/custom_category_list_view.dart';
import '../widgets/custom_dotted_slider.dart';
import '../widgets/custom_product_list_view.dart';
import '../widgets/custom_row_header_and_notification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getIt())
            ..getCategory()
            ..getBanners()
            ..startAutoSlide(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(getIt())..getProducts(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final List<ProductsModel> products =
              context.read<ProductsCubit>().products;

          // Group products by category
          final Map<String, List<ProductsModel>> groupedProducts = {};
          for (var product in products) {
            if (product.categories != null && product.categories!.isNotEmpty) {
              final categoryName =
                  product.categories!.first.name ?? "Uncategorized";
              if (groupedProducts.containsKey(categoryName)) {
                groupedProducts[categoryName]!.add(product);
              } else {
                groupedProducts[categoryName] = [product];
              }
            }
          }

          return Scaffold(
            body: state is HomeLoadingState
                ? AimatedLoader(
                    animation: AppImages.authLoader,
                  )
                : Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, top: 40, left: 16),
                        child: Column(
                          children: [
                            CustomRowHeaderAndNotification(),
                            height(16),
                            CustomSearchBar(
                                controller: TextEditingController()),
                          ],
                        ),
                      ),
                      height(16),
                      SizedBox(
                        height: 150,
                        child: PageView.builder(
                          onPageChanged: cubit.onPageChanged,
                          controller: cubit.pageController,
                          itemCount: cubit.banners.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomImageContainer(
                                image: cubit.banners[index].thumbnailUrl ?? " ",
                              ),
                            );
                          },
                        ),
                      ),
                      height(16),
                      CustomDottedSlider(
                        currentPage: cubit.currentPage,
                        imageLength: cubit.banners.length,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
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
                                //!============= Products by Category ============= !//
                                ...groupedProducts.entries.map((entry) {
                                  final categoryName = entry.key;
                                  final categoryProducts = entry.value;

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomRowTextCategory(
                                        text: categoryName,
                                        onTap: () {
                                          context.push(
                                            Routes.product,
                                            extra: categoryName,
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 150,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return CustomProductListView(
                                              color: cubit.favoriteList
                                                      .contains(
                                                          categoryProducts[
                                                                  index]
                                                              .id
                                                              .toString())
                                                  ? AppColors.redED
                                                  : AppColors.grey8,
                                              onpress: () {
                                                cubit.favorite(
                                                  productId:
                                                      categoryProducts[index]
                                                          .id
                                                          .toString(),
                                                );
                                              },
                                              price: categoryProducts[index]
                                                      .price ??
                                                  "",
                                              categoryName:
                                                  categoryProducts[index]
                                                          .name ??
                                                      "",
                                              image: categoryProducts[index]
                                                          .images
                                                          ?.isNotEmpty ==
                                                      true
                                                  ? categoryProducts[index]
                                                          .images![0]
                                                          .src ??
                                                      ""
                                                  : "",
                                            ).onTap(() {
                                              context.push(
                                                Routes.productDetails,
                                                extra:
                                                    categoryProducts[index].id,
                                              );
                                            });
                                          },
                                          separatorBuilder: (context, index) {
                                            return width(16);
                                          },
                                          itemCount: categoryProducts.length,
                                        ),
                                      ),
                                      height(16),
                                    ],
                                  );
                                }),
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
