import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../components/constant/routes.dart';
import '../../../components/exception_widget.dart';
import '../../../components/loading_widget.dart';
import '../../../cubit/movies_cubit/video_cubit/video_cubit.dart';
import '../../widget/home/movie_row.dart';
import '../../widget/movie/movie_information_row.dart';

class MoviePlayScreen extends StatelessWidget {
  MoviePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> movieVideo =
        ModalRoute.of(context)!.settings.arguments as List;
    int args = movieVideo[0];
    return BlocProvider(
      create: (context) => VideoCubit()..getVideos(id: args),
      child: Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(
              size: 30,
              color: Colors.white,
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                  },
                  child: const Icon(
                    Icons.home_filled,
                  )),
            ]),
        body: BlocConsumer<VideoCubit, VideoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is VideoSuccessfullyState) {
              return ListView(children: [
                YoutubePlayer(
                  thumbnail: Image.network(
                    "https://img.youtube.com/vi/${args.toString()}/hqdefault.jpg",
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
                      MovieInformationRow(
                          language: VideoCubit.movies!.language
                              .toUpperCase()
                              .toString(),
                          year: VideoCubit.movies!.releaseDate.toString(),
                          rating: VideoCubit.movies!.voteCount.toString()),
                      const Text(
                        "Storyline:",
                        style: TextStyle(
                            color: Color(0xffe50914),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        VideoCubit.movies!.overview,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      MovieRow(
                          title: " Recommended",
                          movies: VideoCubit.recommendingMovies),
                      MovieRow(
                          title: " Similar",
                          movies: VideoCubit.similarlyMovies),
                    ],
                  ),
                )
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
