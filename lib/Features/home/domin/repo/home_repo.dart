import 'package:dartz/dartz.dart';
import 'package:two_be/Features/home/data/models/Favorite/favorite_model.dart';
import 'package:two_be/Features/home/data/models/banners_model/banners_model.dart';
import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';
import 'package:two_be/core/network/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategory();
  Future<Either<Failure, List<BannersModel>>> getBanners();
  Future<Either<Failure, List<FavoriteModel>>> favorite(
      {required String productId});
}
