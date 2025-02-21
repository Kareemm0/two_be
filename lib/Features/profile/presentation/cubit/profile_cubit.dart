import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/core/utils/app_images.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

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
}
