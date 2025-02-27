import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/home/domin/repo/home_repo.dart';
import 'package:two_be/core/utils/app_images.dart';

import '../../data/models/category_model/category_model/category_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;
  HomeCubit(this._repo) : super(HomeCubitInitial());
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<CategoryModel> categories = [];

  final List<String> imageUrls = [
    AppImages.slider,
    AppImages.slider,
  ];

  void startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < imageUrls.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(ChangeIndexState(currentPage));
    });
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(ChangeIndexState(currentPage));
  }

  //!============ Get Category ============!//

  Future<void> getCategory() async {
    emit(HomeLoadingState());
    final reslut = await _repo.getCategory();
    reslut.fold(
      (l) => emit(GetCategoryFailureState()),
      (r) {
        categories = r;
        emit(GetCategorySuccessState(r));
      },
    );
  }
}
