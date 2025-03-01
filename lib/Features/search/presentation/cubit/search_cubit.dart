import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import '../../../products/data/Model/products_model/products_model.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductsCubit productsCubit;
  final HomeCubit categoriesCubit;

  SearchCubit(this.productsCubit, this.categoriesCubit)
      : super(SearchInitialState());

  List<ProductsModel> filteredProducts = [];
  List<CategoryModel> filteredCategories = [];

  final TextEditingController searchController = TextEditingController();

  void search(String query) {
    if (query.isEmpty) {
      filteredProducts = productsCubit.products;
      filteredCategories = categoriesCubit.categories;
    } else {
      filteredProducts = productsCubit.products.where((product) {
        final productName = product.name?.toLowerCase() ?? '';
        return productName.contains(query.toLowerCase());
      }).toList();

      filteredCategories = categoriesCubit.categories.where((category) {
        final categoryName = category.name?.toLowerCase() ?? '';
        return categoryName.contains(query.toLowerCase());
      }).toList();
    }

    emit(SearchSuccessState(
      categoryProducts: filteredCategories,
      productsList: filteredProducts,
    ));
  }
}
