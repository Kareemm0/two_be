import 'package:dartz/dartz.dart';
import 'package:two_be/Features/home/data/models/banners_model/banners_model.dart';
import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';
import 'package:two_be/Features/home/data/source/base/home_source.dart';
import 'package:two_be/Features/home/domin/repo/home_repo.dart';
import 'package:two_be/core/network/error/failure.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeSource _source;

  HomeRepoImpl(this._source);
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
    try {
      final response = await _source.getCategory();
      if (response.isEmpty) {
        return Left(ServerFailure('No Data Found'));
      }
      final List<dynamic> countries = response;
      final List<CategoryModel> country = countries
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(country);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BannersModel>>> getBanners() async {
    try {
      final response = await _source.getBanners();
      if (response.isEmpty) {
        return Left(ServerFailure('No Data Found'));
      }
      final List<dynamic> banners = response;
      final List<BannersModel> banner = banners
          .map((json) => BannersModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(banner);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
