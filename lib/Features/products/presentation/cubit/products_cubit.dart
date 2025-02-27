import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';
import 'package:two_be/Features/products/domin/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _repo;
  ProductsCubit(this._repo) : super(ProductsInitalState());

  List<ProductsModel> products = [];
  List<ProductsModel> categoryProducts = [];

  Future<void> getProducts({
    required String category,
  }) async {
    emit(ProductsLoadingState());
    final response = await _repo.getProducts();
    response.fold((l) => emit(ProductsFailureState(l.message)), (r) {
      products.addAll(r);
      categoryProducts = products
          .where((cat) => cat.categories!.first.name == category)
          .toList();
      log("categoryProducts: ${categoryProducts.length}");
      emit(ProcuctsSuccessState(products));
    });
  }
}
