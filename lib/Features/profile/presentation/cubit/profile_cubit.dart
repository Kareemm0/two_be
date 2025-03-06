import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_images.dart';

import '../../../Auth/Data/Model/countries_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

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

  final List<String> profileIcon = [
    AppImages.profile,
    AppImages.setting,
    AppImages.contact,
    AppImages.help,
    AppImages.privacy,
    AppImages.center,
    AppImages.about,
  ];
  final List<String> profile = [
    "الملف الشخصي",
    "الاعدادات",
    "تواصل معنا",
    "المساعدة",
    "سياسة الخصوصية",
    "مركز المساعدة",
    "عن التطبيق",
  ];

  final List<String> routes = [
    Routes.profileInfoScreen,
  ];
}
