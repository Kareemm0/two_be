import 'package:dartz/dartz.dart';
import '../../../../core/network/error/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required String productId,
    int quantity = 1,
  });
}
