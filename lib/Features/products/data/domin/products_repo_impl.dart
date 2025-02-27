import 'package:dartz/dartz.dart';
import 'package:two_be/Features/products/data/Model/ProductDetailsModel/product_details/product_details.dart';
import 'package:two_be/Features/products/data/Model/products_model/products_model.dart';
import 'package:two_be/Features/products/data/source/base/products_source.dart';
import 'package:two_be/Features/products/domin/products_repo.dart';
import 'package:two_be/core/network/error/failure.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsSource _source;

  ProductsRepoImpl(this._source);
  @override
  Future<Either<Failure, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _source.getProducts();
      if (response.isEmpty) {
        return Left(ServerFailure('No Data Found'));
      }
      final List<dynamic> products = response;
      final List<ProductsModel> product = products
          .map((json) => ProductsModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(String id) async {
    try {
      final reponse = await _source.getProductDetails(id);
      if (reponse['id'] == null) {
        return Left(ServerFailure('No Data Found'));
      }
      return Right(ProductDetails.fromJson(reponse));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
