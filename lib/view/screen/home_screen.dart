import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/cubit/movies_cubit/movie_cubit.dart';
import '../../components/constant/colors.dart';
import '../../model/onboardingmodel.dart';
import '../widget/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovies(),
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                
                centerTitle: true,
                title: const Text(
                  OnBoardingModel.logo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: ColorPalette.darkPrimary),
                ),
              ),
              body: const HomeBody())),
    );
  }
}
