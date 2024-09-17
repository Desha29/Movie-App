import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:movie_app/view/screen/movie/movie_details_screen.dart';
import '../../../components/components.dart';
import '../../../cubit/movies_cubit/movie_cubit.dart';
import 'movie_slider_card.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.trendingMovies,
  });
  final List trendingMovies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                    navigateTo(context,
                        MovieDetails(movieItem: trendingMovies[index]));
                  },
                  child: MovieSliderCard(
                    movieItem: trendingMovies[index],
                  ),
                );
              },
            ),
    );
  }
}
