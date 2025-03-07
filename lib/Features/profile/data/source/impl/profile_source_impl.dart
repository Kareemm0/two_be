import 'package:dio/dio.dart';
import 'package:two_be/Features/profile/data/source/base/profile_source.dart';
import 'package:two_be/core/constant/end_points.dart';
import 'package:two_be/core/network/dio/base_dio.dart';
import 'package:two_be/core/service/shared_pref.dart';

import '../../../../../core/constant/app_shared_pref_keys.dart';

class ProfileSourceImpl implements ProfileSource {
  final BaseDio _dio;

  ProfileSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> logout() async {
    final token = await SharedPref().get(AppSharedPrefrencesKeys.tokenKey);

    try {
      final response = await _dio.post(EndPoints.logout,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
