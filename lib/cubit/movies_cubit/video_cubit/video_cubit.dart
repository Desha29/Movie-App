import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/api/get_movies.dart';

part 'video_states.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  static List<Videos> videos = [];
  static int id = 0;
  static List<Movies> recommendingMovies = [];
  static List<Movies> similarlyMovies = [];
  static List<Movies> reviewsMovies = [];
  static String? videoId;
  static Movies? movies;
  Future<void> getVideos({required int id}) async {
    emit(VideoLoadingState());
    YoutubePlayerController controller;

    try {
      await getVideosData(id);

      controller = YoutubePlayerController(
          initialVideoId: videoId.toString(),
          flags: const YoutubePlayerFlags(
              enableCaption: true,
              autoPlay: false,
              mute: false,
              forceHD: true));
      emit(VideoSuccessfullyState(id: id, videos: videos, controller));
    } catch (e) {
      emit(VideoFailedState(message: "get video error"));
    }
  }

  Future<void> getVideosData(int id) async {
    DioHelper.id = id.toString();
    VideoCubit.id = id;
    List videosList = await DioHelper().getMoviesVideos();
    List recommendingMoviesList = await DioHelper().getRecommendedMovies();
    List similarlyMoviesList = await DioHelper().getSimilarMovies();

    videos = Videos.convertToVideos(videosList);
    recommendingMovies = Movies.convertToMovies(recommendingMoviesList);
    similarlyMovies = Movies.convertToMovies(similarlyMoviesList);
    for (var element in videos) {
      videoId = YoutubePlayer.convertUrlToId(element.videokey);
    }
  }
}
