import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:two_be/Features/Auth/Data/Model/user.dart';

import '../../Data/Model/countries_model.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final User user;

  RegisterSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

final class RegisterFailedState extends AuthState {
  final String message;

  RegisterFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

final class GetCountriesFailedState extends AuthState {
  final String message;

  GetCountriesFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

final class GetCountriesSuccessState extends AuthState {
  final List<CountriesModel> countries;

  GetCountriesSuccessState(this.countries);

  @override
  List<Object?> get props => [countries];
}

final class LoginSuccessState extends AuthState {
  final User user;

  LoginSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

final class LoginFailedState extends AuthState {
  final String message;

  LoginFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

final class ImagePickerSuccessState extends AuthState {
  final File image;

  ImagePickerSuccessState(this.image);

  @override
  List<Object?> get props => [image];
}

final class ForgetPasswordSuccessState extends AuthState {
  final String message;

  ForgetPasswordSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

final class ForgetPasswordFailureState extends AuthState {
  final String message;

  ForgetPasswordFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
