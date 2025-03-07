part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {
  final String message;
  const LogoutSuccessState(this.message);
}

final class LogoutFailedState extends ProfileState {
  final String message;
  const LogoutFailedState(this.message);
}
