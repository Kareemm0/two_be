import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';

import '../../../products/data/Model/products_model/products_model.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<ProductsModel> productsList;
  final List<CategoryModel> categoryProducts;

  SearchSuccessState({
    required this.productsList,
    required this.categoryProducts,
  });
}

final class SearchInitialState extends SearchState {}
