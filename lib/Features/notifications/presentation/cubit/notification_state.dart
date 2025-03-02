part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notificationList;
  const NotificationSuccess(this.notificationList);
}

final class NotificationFailure extends NotificationState {
  final String message;
  const NotificationFailure(this.message);
}

final class NotificationLoading extends NotificationState {}
