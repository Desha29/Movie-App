import 'package:flutter/material.dart';
import 'package:movie_app/components/constant/imageassets.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';

import '../../../components/constant/routes.dart';
import '../../../cubit/movies_cubit/video_cubit/video_cubit.dart';
import 'rating_stars.dart';

class MovieContainer extends StatelessWidget {
  MovieContainer({
    super.key,
    required this.Categories,
    required this.movieName,
    required this.movieImage,
    required this.ratingNumber,
    required this.movieStars,
    required this.id,
    required this.movies,
    required this.index,
  });
  final String Categories;
  final String ratingNumber;
  final String movieName;
  final String movieImage;
  final double movieStars;
  final int id;
  final List movies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 135,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(97, 86, 85, 85),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 15,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '${ApiConstants.imageUrl}' + '$movieImage',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AppImageAssets.noImage);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 125,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$movieName",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        RatingStars(
                          MovieStars: movieStars,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "$ratingNumber",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "$Categories",
                    style: const TextStyle(
                        color: Color.fromARGB(128, 184, 184, 184),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: InkWell(
                onTap: () {
                  VideoCubit.movies = movies[index];
                  navigateTo(context, AppRoutes.moviePlayPage, arguments: [id]);
                },
                child: const Icon(
                  Icons.play_circle_outline,
                  color: Color.fromARGB(255, 230, 24, 9),
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
