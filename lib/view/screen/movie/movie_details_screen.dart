import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/components/constant/routes.dart';
import 'package:movie_app/cubit/movies_cubit/cast_cubit/cast_cubit.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/imageassets.dart';
import '../../../cubit/movies_cubit/video_cubit/video_cubit.dart';
import '../../widget/movie/castrow.dart';
import '../../widget/movie/movie_information_row.dart';
import '../../widget/movie/rating_stars.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> movies = ModalRoute.of(context)!.settings.arguments as List;
    var args = movies[0];

    return BlocProvider(
      create: (context) =>
          CastCubit()..getCast(id: movies[1][args].id, movies: movies),
      child: Scaffold(
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
          const GradientColor(height: 300, top: 0, bottom: 300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  height: 250,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${movies[1][args].posterPath}",
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AppImageAssets.noImage);
                    },
                  ),
                ),
                Center(
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies[1][args].title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            Text(
                              '${movies[1][args].voteAverage.roundToDouble()}',
                              style: const TextStyle(
                                  color: Color(0xffe50914),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(width: 15),
                            RatingStars(
                                MovieStars: movies[1][args].voteAverage /
                                    2.roundToDouble()),
                          ],
                        ),
                      ],
                    ),
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
            //arrow back
            top: 30,
            left: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  CastCubit.casts.clear();
                },
                icon: const CircleAvatar(
                  backgroundColor: Color(0xff313131),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
          Positioned(
              top: 400,
              right: 30,
              child: MaterialButton(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                color: const Color.fromARGB(255, 230, 24, 9),
                onPressed: () {
                  VideoCubit.movies = movies[1][args];
                  navigateTo(context, AppRoutes.moviePlayPage,
                      arguments: [movies[1][args].id, movies]);
                },
                child: const Row(
                  children: [
                    Text(
                      "Play",
                      style: TextStyle(fontSize: 22),
                    ),
                    Icon(Icons.play_arrow, color: Colors.white, size: 40),
                  ],
                ),
              )),
        ]),
      )),
    );
  }
}
