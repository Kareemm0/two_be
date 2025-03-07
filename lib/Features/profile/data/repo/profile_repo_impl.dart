import 'package:dartz/dartz.dart';
import 'package:two_be/Features/profile/data/source/base/profile_source.dart';
import 'package:two_be/core/network/error/failure.dart';
import '../../domin/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileSource _source;

  ProfileRepoImpl(this._source);
  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final reponse = await _source.logout();

      if (reponse['code'] == "rest_forbidden") {
        return Left(ServerFailure(reponse['message']));
      }
      return Right(reponse['message']);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
