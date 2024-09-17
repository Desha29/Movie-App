import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../components/components.dart';
import '../../../components/constant/colors.dart';
import '../../../cubit/movies_cubit/video_cubit/video_cubit.dart';
import '../../widget/home/movie_row.dart';
import '../../widget/movie/movie_information_row.dart';
import '../../widget/movie/rating_stars.dart';
import '../../widget/movie/subText.dart';
import '../home_screen.dart';

class MoviePlayScreen extends StatelessWidget {
  MoviePlayScreen({super.key, required this.movieItem});
  final Movies movieItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit()..getVideos(id: movieItem.id),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          ),
        ),
        body: BlocConsumer<VideoCubit, VideoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is VideoSuccessfullyState) {
              return ListView(children: [
                YoutubePlayer(
                  thumbnail: Image.network(
                    "https://img.youtube.com/vi/${movieItem.id.toString()}/hqdefault.jpg",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const ExceptionWidget(
                          message: "!", icon: Icons.error);
                    },
                  ),
                  controller: state.controller,
                  controlsTimeOut: const Duration(milliseconds: 1500),
                  aspectRatio: 16 / 9,
                  showVideoProgressIndicator: true,
                  bufferIndicator: const Center(
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    )),
                  ),
                  progressIndicatorColor: Colors.amber,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieItem.title,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
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
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                MovieInformationRow(
                                    language: movieItem.language
                                        .toUpperCase()
                                        .toString(),
                                    year: movieItem.releaseDate.toString(),
                                    rating: movieItem.voteCount.toString()),
                                const SizedBox(height: 20),
                                ConditionalBuilderRec(
                                  condition:
                                      VideoCubit.recommendingMovies.isNotEmpty,
                                  builder: (context) {
                                    return MovieRow(
                                        title: " Recommended",
                                        movies: VideoCubit.recommendingMovies);
                                  },
                                ),
                                MovieRow(
                                    title: " Similar",
                                    movies: VideoCubit.similarlyMovies),
                              ],
                            ),
                          )
                        ]))
              ]);
            } else if (state is VideoLoadingState) {
              return const LoadingWidget();
            } else if (state is VideoFailedState) {
              return ExceptionWidget(message: state.message, icon: Icons.error);
            } else {
              return const ExceptionWidget(message: "error", icon: Icons.error);
            }
          },
        ),
      ),
    );
  }
}
