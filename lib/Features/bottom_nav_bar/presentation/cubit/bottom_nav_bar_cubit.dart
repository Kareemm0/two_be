import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/bottom_nav_bar/presentation/cubit/bottom_nav_bar_state.dart';
import 'package:two_be/Features/cart/presentation/views/cart_screen.dart';
import 'package:two_be/Features/home/presentation/views/home_screen.dart';
import 'package:two_be/Features/profile/presentation/view/profile_screen.dart';

import '../../../search/presentation/views/search_screen.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarStateInitialState());

  static BottomNavBarCubit get(context) =>
      BlocProvider.of<BottomNavBarCubit>(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
