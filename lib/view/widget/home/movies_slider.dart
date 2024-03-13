import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/api_constants.dart';
import '../../../data/model/movies_model.dart';
import 'movie_roundimage.dart';
import '../../../controller/moviesdata_controlletr.dart';
import '../../../controller/get_movies.dart';
import '../../../core/constant/routes.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: MoviesData.trendingMovies.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Color.fromARGB(255, 237, 55, 55),
            ))
          : CarouselSlider.builder(
              itemCount: MoviesData.trendingMovies.isEmpty
                  ? 0
                  : MoviesData.trendingMovies.length,
              options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlayCurve: Curves.ease,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  pageSnapping: false),
              itemBuilder: (context, index, realIndex) {
                return InkWell(
                  onTap: () async {
                    DioHelper.id =
                        MoviesData.trendingMovies[index].id.toString();
                    List castList = await DioHelper().getCasts();
                    MoviesData.casts = Casts.convertToCasts(castList);
                    Get.toNamed(AppRoutes.moviepage,
                        arguments: [index, MoviesData.trendingMovies]);
                  },
                  child: MovieRoundImage(
                    MovieImage: ApiConstants.imageUrl +
                        MoviesData.trendingMovies[index].posterPath,
                    Moviename: MoviesData.trendingMovies[index].title,
                    Rating: MoviesData.trendingMovies[index].voteAverage
                        .roundToDouble()
                        .toString(),
                    Stars: MoviesData.trendingMovies[index].voteAverage /
                        2.roundToDouble(),
                  ),
                );
              },
            ),
    );
  }
}
