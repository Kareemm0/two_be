import 'package:dartz/dartz.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';
import 'package:two_be/core/network/error/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsModel>>> getProducts();
}
