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

  @override
  Future<List<dynamic>> getBanners() async {
    try {
      final reponse = await _dio.get(EndPoints.banners);
      return reponse.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> favorite({required String productId}) async {
    try {
      final response = await _dio.post(
        EndPoints.favorite,
        data: {"product_id": productId},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
