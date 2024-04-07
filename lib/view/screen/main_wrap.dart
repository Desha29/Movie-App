// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/home/home_cubit.dart';
import 'package:movie_app/cubit/home/home_states.dart';

import '../../components/constant/colors.dart';

// ignore: must_be_immutable
class MainWrap extends StatelessWidget {
  const MainWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavBarCubit(),
        child: BlocConsumer<NavBarCubit, NavbarState>(
          builder: (context, state) {
            NavBarCubit cubit = NavBarCubit.get(context);
            return Scaffold(
                body: cubit.pages
                    .elementAt(NavBarCubit.get(context).currentIndex),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorPalette.darkPrimary,
                  backgroundColor: ColorPalette.darkPrimary1,
                  currentIndex: NavBarCubit.get(context).currentIndex,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: 'Likes'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ],
                  unselectedItemColor: Colors.white,
                  iconSize: 26,
                  onTap: (value) {
                    NavBarCubit.get(context).changeSelectedIndex(value);
                  },
                ));
          },
          listener: (context, state) {},
        ));
  }
}
