import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/components/components.dart';
import 'package:movie_app/cubit/movies_cubit/movie_cubit.dart';
import 'package:movie_app/view/screen/search_screen.dart';
import '../widget/home/drawer_column.dart';
import '../widget/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovies(),
      child: Scaffold(
          drawer: Drawer(
            backgroundColor: const Color.fromARGB(240, 35, 35, 35),
            child: DrawerColumn(),
          ),
          appBar: AppBar(
              iconTheme: const IconThemeData(
                size: 30,
                color: Colors.white,
              ),
              actions: [
                const SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      navigateTo(context, const SearchPage());
                    },
                    child: const Icon(
                      Icons.search,
                    )),
                const SizedBox(width: 10),
                InkWell(
                    // notifications
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications_none_rounded,
                    )),
              ]),
          body: const HomeBody()),
    );
  }
}
