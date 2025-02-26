import 'package:dartz/dartz.dart';
import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';
import 'package:two_be/core/network/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategory();
}
