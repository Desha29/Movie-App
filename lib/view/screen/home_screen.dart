import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/cubit/movies_cubit/movie_cubit.dart';

import '../widget/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovies(),
      child: const SafeArea(child: Scaffold(body: HomeBody())),
    );
  }
}
