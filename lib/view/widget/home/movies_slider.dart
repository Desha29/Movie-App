import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/routes.dart';
import '../../../components/loading_widget.dart';
import '../../../cubit/movies_cubit/movie_cubit.dart';
import 'movie_roundimage.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({
    super.key,
    required this.trendingMovies,
  });
  final List trendingMovies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: MovieCubit.trendingMovies.isEmpty
          ? const LoadingWidget()
          : CarouselSlider.builder(
              itemCount: trendingMovies.isEmpty ? 0 : trendingMovies.length,
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
                    navigateTo(context, AppRoutes.moviepage,
                        arguments: [index, MovieCubit.trendingMovies]);
                  },
                  child: MovieRoundImage(
                    index: index,
                    movieCategories: trendingMovies,
                    id: trendingMovies[index].id,
                    movieImage: ApiConstants.imageUrl +
                        trendingMovies[index].posterPath,
                    moviename: trendingMovies[index].title,
                    rating: trendingMovies[index]
                        .voteAverage
                        .roundToDouble()
                        .toString(),
                    stars:
                        trendingMovies[index].voteAverage / 2.roundToDouble(),
                  ),
                );
              },
            ),
    );
  }
}
