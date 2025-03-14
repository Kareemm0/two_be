import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/constant/end_points.dart';

import '../../../../../core/network/dio/base_dio.dart';
import '../base/products_source.dart';

class ProductsSourceImpl implements ProductsSource {
  final BaseDio _dio;

  ProductsSourceImpl(this._dio);
  @override
  Future<List> getProducts(
      {required int page, required int perPagecount}) async {
    try {
      final response = await _dio.get(EndPoints.products, queryParameters: {
        perPage: perPagecount,
        'page': page,
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getProductDetails(String id) async {
    try {
      final reponse =
          await _dio.get(EndPoints.productsDetails(id), queryParameters: {
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return reponse.data;
    } catch (e) {
      rethrow;
    }
  }
}
