import 'package:flutter/material.dart';
import 'package:movie_app/components/constant/routes.dart';
import '../../../components/components.dart';
import '../../../components/constant/imageassets.dart';
import '../../../cubit/movies_cubit/video_cubit/video_cubit.dart';
import '../movie/rating_stars.dart';

class MovieRoundImage extends StatelessWidget {
  MovieRoundImage({
    super.key,
    required this.movieImage,
    required this.moviename,
    required this.rating,
    required this.stars,
    required this.id,
    required this.movieCategories,
    required this.index,
  });
  final String movieImage;
  final String moviename;
  final String rating;
  final double stars;
  final int id;
  final List movieCategories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              movieImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppImageAssets.noImage);
              },
            ),
          ),
        ),
        const GradientColor(height: 200, top: 0, bottom: 0),
        Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed: () {
                navigateTo(context, AppRoutes.moviePlayPage,
                    arguments: [id, movieCategories]);

                VideoCubit.movies = movieCategories[index];
              },
              icon: const Icon(Icons.play_circle_outline,
                  color: Color(0xffbb1608), size: 40),
            )),
        Positioned(
          bottom: 45,
          left: 20,
          child: Text(
            moviename,
            style: const TextStyle(
              color: Color.fromARGB(141, 255, 255, 255),
              fontSize: 20,
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          child: SingleChildScrollView(
            child: Row(
              children: [
                Text(
                  rating,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 90, 95, 151),
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  width: 5,
                ),
                RatingStars(MovieStars: stars),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
