import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:two_be/Features/Auth/Data/Model/countries_model.dart';
import 'package:two_be/Features/Auth/Data/Model/user.dart';
import 'package:two_be/Features/Auth/Data/source/base/auth_source.dart';
import 'package:two_be/Features/Auth/domian/repo/auth_repo.dart';
import 'package:two_be/core/network/error/failure.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthSource _source;

  AuthRepoImpl(this._source);
  @override
  Future<Either<Failure, User>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required File image,
    required String country,
  }) async {
    try {
      final resonse = await _source.register(
        username: username,
        email: email,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
        image: image,
        country: country,
      );
      if (resonse['token'] == null) {
        return Left(ServerFailure(resonse['message']));
      }
      return Right(User.fromJson(resonse));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CountriesModel>>> getCountries() async {
    try {
      final reponse = await _source.getCountries();
      if (reponse.isEmpty) {
        return Left(ServerFailure('No Data Found'));
      }
      final List<dynamic> countries = reponse;
      final List<CountriesModel> country = countries
          .map((json) => CountriesModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(country);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _source.login(email: email, password: password);
      if (response['token'] != null) {
        return Right(User.fromJson(response));
      }
      return Left(ServerFailure(response['message']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(
      {required String email}) async {
    try {
      final response = await _source.forgetPassword(email: email);
      if (response['status'] == 200) {
        return Right(response['message']);
      }
      return Left(ServerFailure(response['message']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
