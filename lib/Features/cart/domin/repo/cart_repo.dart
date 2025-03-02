import 'package:dartz/dartz.dart';
import 'package:two_be/Features/cart/data/model/cart_model/cart_model.dart';
import '../../../../core/network/error/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required String productId,
    int quantity = 1,
  });

  Future<Either<Failure, List<CartModel>>> getCart();
}
