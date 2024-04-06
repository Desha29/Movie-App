import 'package:dio/dio.dart';
import 'package:movie_app/components/constant/api_constants.dart';

class DioHelper {
  Dio dio = Dio();
  static late String id;
  static late String searchText;

  Future<List> getTopRatedMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/top_rated?language=en-US&page=5&api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getUpComingMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/upcoming?language=en-US&page=1&api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getPopularMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/popular?language=en-US&page=10&api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getNowPlayingMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/now_playing?language=en-US&page=2&api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getTrendingMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/trending/movie/day?language=en-US&api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getSimilarMovies() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/$id/similar?api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getRecommendedMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/recommendations?api_key=f87a718c0481b6962a7c5c4a51ef2757');
    // print(response.data.toString());
    return response.data["results"];
  }

  Future<List> getReviews() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/$id/reviews?api_key=${ApiConstants.apiKey}');

    return response.data["results"];
  }

  Future<List> getCasts() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/$id/credits?api_key=${ApiConstants.apiKey}');

    return response.data["cast"];
  }

// https://api.themoviedb.org/3/movie/5/recommendations?language=en-US&page=1?api_key=f87a718c0481b6962a7c5c4a51ef2757
  Future<List> getMoviesVideos() async {
    Response response = await dio.get(
        '${ApiConstants.baseUrl}/3/movie/$id/videos?api_key=${ApiConstants.apiKey}');
    // print(response.data);

    return response.data["results"];
  }

  Future<List> getSearchedMovie() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/search/movie?query=${searchText}&api_key=f87a718c0481b6962a7c5c4a51ef2757',
    );
    print(response.data);
    return response.data["results"];
  }
}
