import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/movies_model.dart';
import '../../data/api/get_movies.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitialState());

  static List<Movies> upComingMovies = [];
  static List<Movies> nowPlayingMovies = [];
  static List<Movies> topRatedMovies = [];
  static List<Movies> popularMovies = [];
  static List<Movies> trendingMovies = [];
  static List<Movies> result = [];
  getMovies() async {
    emit(MovieLoadingState());

    try {
      await getData();
      emit(MovieSuccessState(
        upComingMovies: upComingMovies,
        trendingMovies: trendingMovies,
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
      ));
    } catch (e) {
      emit(MovieFailedState(message: "FAILED IN GET DATA"));
    }
  }

  Future<void> getData() async {
    List upComingMoviesList = await DioHelper().getUpComingMovies();
    List nowPlayingMoviesList = await DioHelper().getNowPlayingMovies();
    List topRatedMoviesList = await DioHelper().getTopRatedMovies();
    List popularMoviesList = await DioHelper().getPopularMovies();
    List trendingMoviesList = await DioHelper().getTrendingMovies();

    upComingMovies = Movies.convertToMovies(upComingMoviesList);
    nowPlayingMovies = Movies.convertToMovies(nowPlayingMoviesList);
    topRatedMovies = Movies.convertToMovies(topRatedMoviesList);
    popularMovies = Movies.convertToMovies(popularMoviesList);
    trendingMovies = Movies.convertToMovies(trendingMoviesList);
  }
}
