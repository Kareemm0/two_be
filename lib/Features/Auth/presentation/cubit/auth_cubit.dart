import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../Data/Model/countries_model.dart';
import '../../domian/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  AuthCubit(this._repo) : super(AuthInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  List<CountriesModel> countries = [];
  ImagePicker picker = ImagePicker();
  File? profileImage;
  String selectedItem = "";

  //!======== Pick Image =========!//
  Future<void> logoPicker(ImageSource source) async {
    try {
      final pick = await picker.pickImage(source: source);
      if (pick != null) {
        profileImage = File(pick.path);
        emit(ImagePickerSuccessState(profileImage!));
      }
    } catch (e) {
      rethrow;
    }
  }

  //!======== Login Section =========!//
  Future<void> login() async {
    emit(AuthLoadingState());
    if (formKey.currentState!.validate()) {
      final result = await _repo.login(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold(
        (l) => emit(LoginFailedState(l.message)),
        (r) => emit(LoginSuccessState(r)),
      );
    }
  }

  //!======== Register Section =========!//
  Future<void> register() async {
    emit(AuthLoadingState());
    if (formKey.currentState!.validate()) {
      final result = await _repo.register(
        username: usernameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        image: profileImage!,
      );

      result.fold(
        (l) => emit(RegisterFailedState(l.message)),
        (r) => emit(RegisterSuccessState(r)),
      );
    }
  }

  //!======== Get Countries Section =========!//

  Future<void> getCountries() async {
    emit(AuthLoadingState());
    final result = await _repo.getCountries();
    result.fold((l) => emit(GetCountriesFailedState(l.message)), (r) {
      countries = r;
      emit(GetCountriesSuccessState(r));
    });
  }
}
