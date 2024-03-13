// ignore_for_file: avoid_print

import 'package:movie_app/controller/get_movies.dart';
import '../data/model/movies_model.dart';

class MoviesData {
  static List<Movies> upComingMovies = [];
  static List<Movies> nowPlayingMovies = [];
  static List<Movies> topRatedMovies = [];
  static List<Movies> popularMovies = [];
  static List<Movies> trendingMovies = [];
  static List<Casts> casts = [];

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
