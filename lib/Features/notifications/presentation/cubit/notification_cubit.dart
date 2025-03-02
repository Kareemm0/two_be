import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/notifications/domin/repo/notification_repo.dart';
import '../../data/model/notification/notification/notification.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _repo;
  NotificationCubit(this._repo) : super(NotificationInitial());

  List<NotificationModel> notifications = [];

  Future<void> notification() async {
    emit(NotificationLoading());
    final result = await _repo.notification();
    result.fold((l) => emit(NotificationFailure(l.message)), (r) {
      notifications = r;
      emit(NotificationSuccess(r));
    });
  }
}
