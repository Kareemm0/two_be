import 'package:dartz/dartz.dart';
import 'package:two_be/Features/notifications/data/model/notification/notification/notification.dart';
import 'package:two_be/core/network/error/failure.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> notification();
}
