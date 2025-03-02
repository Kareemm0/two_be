import 'package:dartz/dartz.dart';

import 'package:two_be/Features/notifications/data/model/notification/notification/notification.dart';
import 'package:two_be/Features/notifications/data/source/base/notification_source.dart';

import 'package:two_be/core/network/error/failure.dart';

import '../../domin/repo/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationSource _source;

  NotificationRepoImpl(this._source);
  @override
  Future<Either<Failure, List<NotificationModel>>> notification() async {
    try {
      final reponse = await _source.getNotifications();
      if (reponse.isEmpty) {
        return Left(ServerFailure('No Data Found'));
      }
      final List<dynamic> notifications = reponse;
      final List<NotificationModel> notification = notifications
          .map((json) =>
              NotificationModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(notification);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
