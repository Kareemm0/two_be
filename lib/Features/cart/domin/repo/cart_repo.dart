import 'package:dartz/dartz.dart';
import 'package:two_be/Features/cart/data/model/cart_model/cart_model.dart';
import 'package:two_be/Features/cart/data/model/order/order_model/order_model.dart';
import '../../../../core/network/error/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required String productId,
    int quantity = 1,
  });

  Future<Either<Failure, CartModel>> getCart();

  Future<Either<Failure, OrderModel>> createOrder({
    String? paymentMehthod,
    String? customerName,
    String? customerPhone,
    String? customerEmail,
    String? address,
    String? city,
    String? state,
    List<Map<String, dynamic>>? lineItems,
  });
  Future<Either<Failure, String>> deleteItemFromCart(
      {required String productKey});
}
