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

  String extractCookieValue(List<String> cookies) {
    List<String> cookieValues = [];

    for (String cookie in cookies) {
      cookie = cookie.trim();
      List<String> parts = cookie.split(';');
      if (parts.isNotEmpty) {
        cookieValues.add(parts[0]);
      }
    }
    return cookieValues.join('; ');
  }

  Future<void> updateCookieFromResponse(Response response) async {
    final cookies = response.headers['set-cookie'];
    if (cookies != null && cookies.isNotEmpty) {
      final cookieValue = extractCookieValue(cookies);
      log("Extracted Cookie Value: $cookieValue");
      await saveCookie(cookieValue);
    } else {
      log("No cookies found in the response.");
    }
  }

  @override
  Future<Map<String, dynamic>> addToCart({
    required String productId,
    int quantity = 1,
  }) async {
    final cookie = await getCookie();
    try {
      final response = await _dio.post(
        EndPoints.addToCart,
        data: {
          "id": productId,
          "quantity": quantity,
        },
        options: Options(
          headers: {
            "Cookie": cookie,
          },
        ),
      );
      if (cookie == null) {
        await updateCookieFromResponse(response);
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getCart() async {
    try {
      final cookie = await getCookie();
      log("cookie in Cart : $cookie");
      if (cookie == null) {
        throw Exception('No cookie found');
      }
      final response = await _dio.get(EndPoints.carts,
          options: Options(headers: {
            "Cookie": cookie,
          }));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createOrder(
      {String? paymentMehthod,
      String? customerName,
      String? customerPhone,
      String? customerEmail,
      String? address,
      String? city,
      String? state,
      List<Map<String, dynamic>>? lineItems}) async {
    try {
      final data = {
        "payment_method_title": paymentMehthod,
        "billing": {
          "first_name": customerName,
          "phone": customerPhone,
          "email": customerEmail,
          "address_1": address,
          "city": city,
          "state": state,
        },
        "shipping": {
          "first_name": customerName,
          "address_1": address,
          "city": city,
          "state": state,
        },
        "line_items": lineItems
      };
      final response = await _dio.post(
        EndPoints.createOrder,
        queryParameters: {
          consumerKeyValue: consumerKey,
          consumerSecretValue: consumerSecret
        },
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> deleteItemFromCart({required String productKey}) async {
    try {
      final cookie = await getCookie();
      log("cookie in Cart : $cookie");
      if (cookie == null) {
        throw Exception('No cookie found');
      }
      final response =
          await _dio.delete(EndPoints.deleteItemFromCar(productKey),
              options: Options(headers: {
                "Cookie": cookie,
              }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
