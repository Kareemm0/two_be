import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/constant/end_points.dart';

import '../../../../../core/network/dio/base_dio.dart';
import '../base/products_source.dart';

class ProductsSourceImpl implements ProductsSource {
  final BaseDio _dio;

  ProductsSourceImpl(this._dio);
  @override
  Future<List> getProducts() async {
    try {
      final response = await _dio.get(EndPoints.products, queryParameters: {
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
