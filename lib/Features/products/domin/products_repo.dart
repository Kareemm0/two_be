import 'package:dartz/dartz.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';
import 'package:two_be/core/network/error/failure.dart';
import '../data/Model/ProductDetailsModel/product_details/product_details.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsModel>>> getProducts(
      {required int page, required int perPagecount});
  Future<Either<Failure, ProductDetails>> getProductDetails(String id);
}
