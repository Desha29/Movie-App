import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constant/api_constants.dart';
import '/../controller/moviesdata_controlletr.dart';
import '/../view/widget/moviedetails/castrow.dart';
import '/../view/widget/moviedetails/movie_information_row.dart';
import '/../view/widget/moviedetails/rating_stars.dart';
import '../../widget/grandientcolors.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});

  List movies = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var args = movies[0];
    return Scaffold(
        body: Container(
      child: Stack(children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(
                      ApiConstants.imageUrl + movies[1][args].backdropPath))),
        ),
        GrandientColor(height: 200, top: 0, bottom: 300),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                height: 250,
                child: Image.network(
                    "https://image.tmdb.org/t/p/w500${movies[1][args].posterPath}"),
              ),
              Center(
                child: Column(children: [
                  Text(
                    movies[1][args].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${movies[1][args].voteAverage.roundToDouble()}',
                    style: const TextStyle(
                        color: Color(0xffe50914),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  RatingStars(
                      MovieStars:
                          movies[1][args].voteAverage / 2.roundToDouble()),
                  MovieInformationRow(
                      language: movies[1][args].language.toUpperCase(),
                      year: movies[1][args].releaseDate,
                      rating: movies[1][args].voteCount.toString()),
                ]),
              ),
              const Text(
                "Storyline",
                style: TextStyle(
                    color: Color(0xffe50914),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                movies[1][args].overview,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Cast",
                  style: TextStyle(
                      color: Color(0xffe50914),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const CastRow()
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: IconButton(
              onPressed: () {
                Get.back();
                MoviesData.casts.clear();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              )),
        ),
      ]),
    ));
  }
}
