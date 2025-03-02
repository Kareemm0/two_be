import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/home/domin/repo/home_repo.dart';
import '../../data/models/banners_model/banners_model.dart';
import '../../data/models/category_model/category_model/category_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;
  HomeCubit(this._repo) : super(HomeCubitInitial());
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<CategoryModel> categories = [];
  List<BannersModel> banners = [];

  Set<String> favoriteList = {};

  Future<void> loadData() async {
    emit(HomeLoadingState());
    try {
      await Future.wait([
        getCategory(),
        getBanners(),
      ]);

      startAutoSlide();
      emit(HomeSucssessState());
    } catch (e) {
      emit(HomeFailureState(e.toString()));
    }
  }

  Future<void> favorite({required String productId}) async {
    emit(HomeLoadingState());
    final result = await _repo.favorite(productId: productId);

    result.fold(
      (l) => emit(FavoriteFailureState()),
      (r) {
        if (favoriteList.contains(productId)) {
          favoriteList.remove(productId);
        } else {
          favoriteList.add(productId);
        }
        emit(FavoriteSuccessState(favoriteList));
      },
    );
  }

  void startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < banners.length - 1) {
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

  //!============ Get Banners ============!//

  Future<void> getBanners() async {
    emit(HomeLoadingState());
    final reslut = await _repo.getBanners();
    reslut.fold(
      (l) => emit(GetBannersFailureState()),
      (r) {
        banners = r;
        emit(GetBannersSuccessState(r));
      },
    );
  }
}
