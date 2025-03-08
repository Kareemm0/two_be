import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:two_be/Features/cart/data/source/base/cart_source.dart';
import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/constant/end_points.dart';
import 'package:two_be/core/network/dio/base_dio.dart';

import '../../../../../core/cache/save_user_info.dart';

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
      final response = await _dio.get(EndPoints.carts,
          options: Options(headers: {
            "Cookie":
                "wp_woocommerce_session_33406d7504722fbe08512fcd59265ff6=t_04ce3e67eafb89e15dc5b77acb33dc%7C%7C1741430361%7C%7C1741426761%7C%7C577e4b4492d2ab9c50d4cc09f19ba36c"
          }));
      // await updateCookieFromResponse(response);
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
