import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/products/data/Model/ProductDetailsModel/product_details/product_details.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';
import 'package:two_be/Features/products/domin/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _repo;
  ProductsCubit(this._repo) : super(ProductsInitalState());

  List<ProductsModel> products = [];
  List<ProductsModel> categoryProducts = [];
  ProductDetails? productDetails;
  ProductDetails? productDetailsById;
  int perPagecount = 10;
  int page = 1;
  bool hasMore = true;

  Future<void> getProducts({
    String? category,
    bool isLoadMore = false,
  }) async {
    if (!hasMore && isLoadMore) return;
    if (!isLoadMore) {
      page = 1;
      hasMore = true;
      products.clear();
      emit(ProductsLoadingState());
    } else {
      emit(ProductsPaginationState());
    }

    final response =
        await _repo.getProducts(page: page, perPagecount: perPagecount);

    response.fold(
      (l) {
        hasMore = false;
        emit(ProductsFailureState(l.message));
      },
      (r) {
        if (r.isEmpty) {
          hasMore = false;
        } else {
          page++;
          products.addAll(r);
        }

        if (category != null) {
          log("Filtering products for category: $category");

          for (var product in products) {
            log("Product: ${product.name}, Categories: ${product.categories?.map((cat) => cat.name).toList()}");
          }

          categoryProducts = products
              .where((product) =>
                  product.categories != null &&
                  product.categories!.any((cat) =>
                      cat.name?.toLowerCase() == category.toLowerCase()))
              .toList();

          log("Filtered categoryProducts: ${categoryProducts.length}");
          for (var product in categoryProducts) {
            log("Filtered Product: ${product.name}, Categories: ${product.categories?.map((cat) => cat.name).toList()}");
          }

          emit(ProcuctsSuccessState(categoryProducts));
        } else {
          emit(ProcuctsSuccessState(products));
        }

        if (r.length < perPagecount) {
          hasMore = false;
        }
      },
    );
  }

  Future<void> getProductsDetails({
    required String id,
  }) async {
    emit(ProductsLoadingState());
    final response = await _repo.getProductDetails(id);
    response.fold((l) => emit(ProductsDetailsFailureState(l.message)), (r) {
      productDetails = r;

      if (productDetails!.id.toString() == id.toString()) {
        productDetailsById = productDetails;
        log("productDetailsById: ${productDetailsById!.id}");
      } else {
        log("productDetailsById is null");
        productDetailsById = null;
      }

      log("categoryProducts: ${categoryProducts.length}");
      emit(ProductsDetailsSuccessState(productDetails!));
    });
  }
}
