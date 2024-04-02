import 'package:flutter/material.dart';
import 'package:movie_app/view/screen/auth/login_screen.dart';
import 'package:movie_app/view/screen/auth/signup_screen.dart';

import 'components/constant/routes.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/movie/movie_categories_screen.dart';
import 'view/screen/movie/movie_details_screen.dart';
import 'view/screen/movie/movie_play_screen.dart';

import 'view/screen/search_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.loginPage: (context) => const LoginScreen(),
  AppRoutes.signupPage: (context) => const SignUpScreen(),
  AppRoutes.homePage: (context) => HomeScreen(),
  AppRoutes.moviepage: (context) => MovieDetails(),
  AppRoutes.movieTypePage: (context) => MovieTypePage(),
  AppRoutes.searchPage: (context) => const SearchPage(),
  AppRoutes.moviePlayPage: (context) => MoviePlayScreen(),
};
