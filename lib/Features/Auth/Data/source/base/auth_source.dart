import 'dart:io';

abstract class AuthSource {
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required File image,
    required String country,
  });

  Future<List<dynamic>> getCountries();
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> forgetPassword({required String email});
}
