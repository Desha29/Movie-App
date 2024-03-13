import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../widget/movie_categories/MovieContainer.dart';

class MovieTypePage extends StatelessWidget {
  MovieTypePage({super.key});

  List moreMovies = Get.arguments;
  @override
  Widget build(BuildContext context) {
    String type = moreMovies[0];
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.white70),
          backgroundColor: Colors.transparent,
          title: Text(
            type,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.searchPage);
                },
                child: const Icon(Icons.search, size: 30)),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: moreMovies[1].length,
            itemBuilder: (context, index) {
              return MovieContainer(
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
