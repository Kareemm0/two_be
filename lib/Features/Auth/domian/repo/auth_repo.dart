import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:two_be/Features/Auth/Data/Model/countries_model.dart';
import 'package:two_be/core/network/error/failure.dart';

import '../../Data/Model/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required File image,
    required String country,
  });

  Future<Either<Failure, List<CountriesModel>>> getCountries();
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> forgetPassword({required String email});
}
