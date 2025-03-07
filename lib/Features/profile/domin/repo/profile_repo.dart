import 'package:dartz/dartz.dart';
import 'package:two_be/core/network/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> logout();
}
