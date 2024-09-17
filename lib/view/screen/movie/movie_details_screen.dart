import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movies_cubit/cast_cubit/cast_cubit.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/view/screen/movie/movie_play_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/colors.dart';

import '../../../components/constant/images_assets.dart';
import '../../widget/home/custom_button.dart';
import '../../widget/movie/castrow.dart';
import '../../widget/movie/movie_information_row.dart';
import '../../widget/movie/rating_stars.dart';

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
          body: Stack(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: NetworkImage(
                        ApiConstants.imageUrl + movieItem.backdropPath))),
          ),
          const GradientColor(height: 200, top: 0, bottom: 400),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.imageUrl}' '${movieItem.posterPath}',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(),
                      ),
                      errorWidget: (context, error, stackTrace) {
                        return Image.asset(AppImageAssets.noImage);
                      },
                    ),
                  ),
                ),
                Center(
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieItem.title,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${movieItem.voteAverage.roundToDouble()}',
                                  style: const TextStyle(
                                      color: ColorPalette.darkPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(width: 15),
                                RatingStars(
                                    MovieStars: movieItem.voteAverage /
                                        2.roundToDouble()),
                                const SizedBox(width: 15),
                              ],
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
                                text: 'Watch',
                              ),
                            ),
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
                const Text("Storyline",
                    style: TextStyle(
                        color: ColorPalette.darkPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text(movieItem.overview,
                    maxLines: 4,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const Text("Cast",
                    style: TextStyle(
                        color: ColorPalette.darkPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const Expanded(child: CastRow())
              ],
            ),
          ),
          Positioned(
            top: 30,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      CastCubit.casts.clear();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    )),
                const SizedBox(width: 300),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          // Positioned(
          //   top: 280,
          //   right: 25,

          // )
        ],
      )),
    );
  }
}
