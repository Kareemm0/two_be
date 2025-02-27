import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/di.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widget/custom_product_item.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryName;
  const ProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt())..getProducts(category: categoryName),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final cubit = context.read<ProductsCubit>();
          return state is ProductsLoadingState
              ? AimatedLoader(
                  animation: AppImages.loading,
                )
              : Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      children: [
                        CustomHeaderAndIcon(title: "المنتجات"),
                        Expanded(
                          child: cubit.categoryProducts.isEmpty
                              ? AimatedLoader(
                                  animation: AppImages.emptyList,
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) =>
                                      CustomProductItem(
                                    imageUrl: cubit.categoryProducts[index]
                                            .images![index].src ??
                                        "",
                                    title: cubit.categoryProducts[index].name ??
                                        "",
                                    price:
                                        cubit.categoryProducts[index].price ??
                                            "",
                                  ).onTap(() {
                                    context.push(Routes.productDetails,
                                        extra:
                                            cubit.categoryProducts[index].id);
                                  }),
                                  separatorBuilder: (context, index) =>
                                      height(16),
                                  itemCount: cubit.categoryProducts.length,
                                ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
