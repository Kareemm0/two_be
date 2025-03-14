import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/aimated_loader.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widget/custom_product_item.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryName;
  const ProductsScreen({super.key, required this.categoryName});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController _scrollController = ScrollController();
  late ProductsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ProductsCubit(getIt())..getProducts(category: widget.categoryName);
    _scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_cubit.hasMore) {
        _cubit.getProducts(category: widget.categoryName, isLoadMore: true);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
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
                                  controller: _scrollController,
                                  itemCount: cubit.categoryProducts.length,
                                  itemBuilder: (context, index) =>
                                      CustomProductItem(
                                    imageUrl: cubit.categoryProducts[index]
                                                .images?.isNotEmpty ==
                                            true
                                        ? cubit.categoryProducts[index]
                                                .images![0].src ??
                                            ""
                                        : "",
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
                                ),
                        )
                      ],
                    ),
                  ),
                  floatingActionButton:
                      BlocBuilder<ProductsCubit, ProductsState>(
                          builder: (context, state) {
                    if (state is ProductsPaginationState) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(25),
                          elevation: 10,
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircularProgressIndicator(
                                  color: AppColors.blackColor,
                                ),
                              )),
                        ),
                      );
                    } else {
                      return Text('');
                    }
                  }));
        },
      ),
    );
  }
}
