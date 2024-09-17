import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/constant/colors.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/images_assets.dart';
import '../../../model/movies_model.dart';
import '../movie/rating_stars.dart';

class MovieSliderCard extends StatelessWidget {
  const MovieSliderCard({
    super.key,
    required this.movieItem,
  });

  final Movies movieItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 700,
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
        const GradientColor(height: 200, top: 0, bottom: -90),
        Positioned(
          bottom: 50,
          left: 20,
          child: Text(
            movieItem.title,
            maxLines: 1,
            softWrap: true,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          child: SingleChildScrollView(
            child: Row(
              children: [
                Text(
                  movieItem.voteAverage.roundToDouble().toString(),
                  style: const TextStyle(
                      color: ColorPalette.darkPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  width: 8,
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
