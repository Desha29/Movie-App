import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/components/components.dart';

import '../../../components/constant/routes.dart';
import '../../widget/movie/movie_container.dart';

// ignore: must_be_immutable
class MovieTypePage extends StatelessWidget {
  MovieTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    List moreMovies = ModalRoute.of(context)!.settings.arguments as List;
    String type = moreMovies[0];
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.white),
          backgroundColor: Colors.transparent,
          title: Text(
            type,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
                onTap: () {
                  navigateTo(context, AppRoutes.searchPage);
                },
                child: const Icon(Icons.search, size: 30)),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: moreMovies[1].length,
            itemBuilder: (context, index) {
              return MovieContainer(
                index: index,
                movies: moreMovies[1],
                id: moreMovies[1][index].id,
                movieStars:
                    moreMovies[1][index].voteAverage / 2.roundToDouble(),
                movieName: moreMovies[1][index].title,
                ratingNumber:
                    moreMovies[1][index].voteAverage.roundToDouble().toString(),
                Categories: "Action/Drama/Horror",
                movieImage: moreMovies[1][index].posterPath,
              );
            }),
      ),
    );
  }
}
