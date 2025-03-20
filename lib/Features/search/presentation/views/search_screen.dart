import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_category_grid_view_item.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/Features/products/presentation/cubit/products_cubit.dart';
import 'package:two_be/core/utils/app_images.dart';
import 'package:two_be/core/widgets/aimated_loader.dart';
import 'package:two_be/core/widgets/custom_search_bar.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        context.read<ProductsCubit>(),
        context.read<HomeCubit>(),
      ),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  CustomHeaderAndIcon(title: "بحث"),
                  height(24),
                  CustomSearchBar(
                    controller: cubit.searchController,
                    onChanged: (query) {
                      log(cubit.searchController.text);
                      log("Query: $query");
                      cubit.search(query);
                    },
                  ),
                  height(16),
                  if (state is SearchSuccessState &&
                      state.productsList.isEmpty &&
                      state.categoryProducts.isEmpty) ...[
                    Flexible(
                      child: AimatedLoader(
                        animation: AppImages.emptyList,
                      ),
                    )
                  ] else ...[
                    // Show results
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state is SearchSuccessState &&
                                  state.productsList.isNotEmpty) ...[
                                Text("المنتجات",
                                    style: AppTextStyle.style20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    )),
                                height(8),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 8, top: 4),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CustomCategoryGridViewItem(
                                        title: state.productsList[index].name ??
                                            '',
                                        image: state.productsList[index].images!
                                                    .isEmpty ==
                                                true
                                            ? state.productsList[index]
                                                    .images![0].src ??
                                                ''
                                            : "");
                                  },
                                  itemCount: state.productsList.length,
                                ),
                              ],
                              height(16),
                              if (state is SearchSuccessState &&
                                  state.categoryProducts.isNotEmpty) ...[
                                Text("الاقسام",
                                    style: AppTextStyle.style20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    )),
                                height(8),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.categoryProducts.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(state
                                                .categoryProducts[index]
                                                .image
                                                ?.src ??
                                            ''),
                                      ),
                                      title: Text(
                                          state.categoryProducts[index].name ??
                                              ''),
                                    );
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
