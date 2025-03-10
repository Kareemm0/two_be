import 'package:two_be/Features/cart/data/source/base/cart_source.dart';
import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/constant/end_points.dart';
import 'package:two_be/core/network/dio/base_dio.dart';

class CartSourceImpl implements CartSource {
  final BaseDio _dio;

  CartSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    int quantity = 1,
  }) async {
    try {
      final response = await _dio.post(EndPoints.addToCart, data: {
        "id": productId,
        "quantity": quantity,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getCart() async {
    try {
      final response = await _dio.get(EndPoints.carts);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createOrder() async {
    try {
      final response = await _dio.post(EndPoints.createOrder, queryParameters: {
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
