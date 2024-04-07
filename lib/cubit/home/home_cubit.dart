import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/home/home_states.dart';
import 'package:movie_app/view/screen/search_screen.dart';

import '../../view/screen/favorite_screen.dart';
import '../../view/screen/home_screen.dart';
import '../../view/screen/profile_screen.dart';

class NavBarCubit extends Cubit<NavbarState> {
  NavBarCubit() : super(NavbarInitialState());
  static NavBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    const FavoritePage(),
    const SearchPage(),
    ProfileScreen(),
  ];

  void changeSelectedIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
