import 'package:dartz/dartz.dart';
import 'package:two_be/Features/cart/data/model/cart_model/cart_model.dart';
import 'package:two_be/Features/cart/data/source/base/cart_source.dart';
import 'package:two_be/core/network/error/failure.dart';
import '../domin/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartSource _source;

  CartRepoImpl(this._source);
  @override
  Future<Either<Failure, String>> addToCart(
      {required String productId, int quantity = 1}) async {
    try {
      final response = await _source.addToCart(
        productId: productId,
        quantity: quantity,
      );
      if (response['items'] == null) {
        return Left(ServerFailure("No Data Found"));
      }
      return Right("تم اضافة المنتج الي السلة بنجاح");
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      final response = await _source.getCart();
      if (response['items'] == null) {
        return Left(ServerFailure("No Data Found"));
      }
      final List<dynamic> carts = response['items'];
      final List<CartModel> cart = carts
          .map((json) => CartModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(cart);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
