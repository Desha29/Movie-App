import 'package:flutter/material.dart';

import 'core/constant/routes.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/login_or_signup.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/home.dart';
import 'view/screen/movie_categories.dart';
import 'view/screen/moviepage/movie_details.dart';
import 'view/screen/search.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.choose: (context) => LoginOrSignup(),
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signup: (context) => const SignUp(),
  AppRoutes.home: (context) => HomePage(),
  AppRoutes.moviepage: (context) => MovieDetails(),
  AppRoutes.movieTypePage: (context) => MovieTypePage(),
  AppRoutes.searchPage: (context) => const SearchPage(),
};
