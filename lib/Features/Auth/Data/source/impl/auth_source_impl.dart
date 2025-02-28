import 'dart:io';

import 'package:dio/dio.dart';
import 'package:two_be/Features/Auth/Data/source/base/auth_source.dart';
import 'package:two_be/core/constant/end_points.dart';

import '../../../../../core/network/dio/base_dio.dart';

class AuthSourceImpl implements AuthSource {
  final BaseDio dio;

  AuthSourceImpl(this.dio);
  @override
  @override
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String country,
    required File image,
  }) async {
    try {
      MultipartFile multipartFile = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last, // Extract filename
      );

      FormData formData = FormData.fromMap({
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "confirm_password": passwordConfirmation,
        "country": country,
        "image": multipartFile,
      });

      final response = await dio.post(
        EndPoints.register,
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> getCountries() async {
    try {
      final response = await dio.get(EndPoints.countries);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(EndPoints.login, data: {
        "username_or_email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    try {
      final reposnse = await dio.post(
        EndPoints.forgetPassword,
        data: {"email": email},
      );
      return reposnse.data;
    } catch (e) {
      rethrow;
    }
  }
}
