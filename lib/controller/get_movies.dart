import 'package:dio/dio.dart';

class DioHelper {
  Dio dio = Dio();
  static late String id;
  Future<List> getTopRatedMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=f87a718c0481b6962a7c5c4a51ef2757');

    return response.data["results"];
  }

  Future<List> getUpComingMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=f87a718c0481b6962a7c5c4a51ef2757');

    return response.data["results"];
  }

  Future<List> getPopularMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=f87a718c0481b6962a7c5c4a51ef2757');

    return response.data["results"];
  }

  Future<List> getNowPlayingMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1&api_key=f87a718c0481b6962a7c5c4a51ef2757');

    return response.data["results"];
  }

  Future<List> getTrendingMovies() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=f87a718c0481b6962a7c5c4a51ef2757');
    print(response.data.toString());
    return response.data["results"];
  }

  Future<List> getCasts() async {
    Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=f87a718c0481b6962a7c5c4a51ef2757');
    // print(response.data.toString());
    return response.data["cast"];
  }
}
