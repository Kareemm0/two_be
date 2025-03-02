import 'package:two_be/core/network/dio/base_dio.dart';

import '../../../../../core/constant/end_points.dart';
import '../base/notification_source.dart';

class NotificationSourceImpl implements NotificationSource {
  final BaseDio _dio;

  NotificationSourceImpl(this._dio);
  @override
  Future<List> getNotifications() async {
    try {
      final reponse = await _dio.get(EndPoints.notification);
      return reponse.data;
    } catch (e) {
      rethrow;
    }
  }
}
