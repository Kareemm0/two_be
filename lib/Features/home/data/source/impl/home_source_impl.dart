import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/core/network/dio/base_dio.dart';

import '../../../../../core/constant/end_points.dart';
import '../base/home_source.dart';

class HomeSourceImpl implements HomeSource {
  final BaseDio _dio;

  HomeSourceImpl(this._dio);

  @override
  Future<List<dynamic>> getCategory() async {
    try {
      final response = await _dio.get(EndPoints.catgory, queryParameters: {
        consumerKeyValue: consumerKey,
        consumerSecretValue: consumerSecret,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
