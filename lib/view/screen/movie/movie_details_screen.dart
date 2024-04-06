import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movies_cubit/cast_cubit/cast_cubit.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/view/screen/movie/movie_play_screen.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/colors.dart';
import '../../../components/constant/dark_theme.dart';
import '../../../components/constant/imageassets.dart';
import '../../widget/home/custom_button.dart';
import '../../widget/movie/castrow.dart';
import '../../widget/movie/movie_information_row.dart';
import '../../widget/movie/rating_stars.dart';
import '../../widget/movie/subText.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movieItem});
  final Movies movieItem;
  @override
  Widget build(BuildContext context) {
    List<dynamic> movies = [];
    return BlocProvider(
      create: (context) =>
          CastCubit()..getCast(id: movieItem.id, movies: movies),
      child: Scaffold(
          body: Stack(children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(
                      ApiConstants.imageUrl + movieItem.backdropPath))),
        ),
        const GradientColor(height: 200, top: 0, bottom: 350),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                height: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${movieItem.posterPath}",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(AppImageAssets.noImage);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(
                          context,
                          MoviePlayScreen(movieItem: movieItem),
                        );
                      },
                      child: const CustomIconButton(
                        icon: Icons.play_circle_rounded,
                        border: false,
                        text: 'Play',
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieItem.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            '${movieItem.voteAverage.roundToDouble()}',
                            style: const TextStyle(
                                color: ColorPalette.darkPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(width: 15),
                          RatingStars(
                              MovieStars:
                                  movieItem.voteAverage / 2.roundToDouble()),
                        ],
                      ),
                    ],
                  ),
                  MovieInformationRow(
                      language: movieItem.language.toUpperCase(),
                      year: movieItem.releaseDate,
                      rating: movieItem.voteCount.toString()),
                ]),
              ),
              Text("Storyline", style: darkTheme.textTheme.labelLarge),
              const SizedBox(height: 10),
              ExpandableText(text: movieItem.overview),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Cast", style: darkTheme.textTheme.labelLarge),
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
                Navigator.pop(context);
                CastCubit.casts.clear();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              )),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.white,
              )),
        ),
      ])),
    );
  }
}
