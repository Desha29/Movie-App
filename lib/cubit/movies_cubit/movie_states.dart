part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitialState extends MovieState {}

final class MovieLoadingState extends MovieState {}

final class MovieSuccessState extends MovieState {
  final List<Movies> upComingMovies;
  final List<Movies> nowPlayingMovies;
  final List<Movies> topRatedMovies;
  final List<Movies> popularMovies;
  final List<Movies> trendingMovies;

  // final List<Casts> casts ;
  // final List<Videos> videos;

  MovieSuccessState({
    required this.upComingMovies,
    required this.nowPlayingMovies,
    required this.topRatedMovies,
    required this.popularMovies,
    required this.trendingMovies,
  });
}

final class MovieFailedState extends MovieState {
  final String message;

  MovieFailedState({required this.message});
}
