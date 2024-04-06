import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/screen/movie/movie_play_screen.dart';
import 'package:movie_app/view/widget/home/custom_button.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/imageassets.dart';
import '../../../model/movies_model.dart';
import '../movie/rating_stars.dart';

class MovieRoundImage extends StatelessWidget {
  const MovieRoundImage({
    super.key,
    required this.movieItem,
  });

  final Movies movieItem;
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
            child: CachedNetworkImage(
              imageUrl: ApiConstants.imageUrl + movieItem.posterPath,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(),
              ),
              errorWidget: (context, error, stackTrace) {
                return Image.asset(AppImageAssets.noImage);
              },
            ),
          ),
        ),
        const GradientColor(height: 200, top: 0, bottom: -30),
        Positioned(
          bottom: 30,
          right: 30,
          child: InkWell(
            onTap: () {
              navigateTo(
                context,
                MoviePlayScreen(movieItem: movieItem),
              );
            },
            child: const CustomIconButton(
              icon: Icons.play_circle_rounded,
              border: false,
              text: 'Play',
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: 20,
          child: Text(
            movieItem.title,
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
                  movieItem.voteAverage.roundToDouble().toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 90, 95, 151),
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  width: 5,
                ),
                RatingStars(
                    MovieStars: movieItem.voteAverage / 2.roundToDouble()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
