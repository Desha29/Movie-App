import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/constant/imageassets.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/view/screen/movie/movie_play_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../home/custom_button.dart';
import 'rating_stars.dart';

class MovieContainer extends StatelessWidget {
  MovieContainer({
    super.key,
    required this.movieItem,
  });

  final Movies movieItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
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
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.imageUrl}' + '${movieItem.posterPath}',
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
            ),
            Positioned(
              left: 125,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieItem.title,
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
                          MovieStars: movieItem.voteAverage / 2.roundToDouble(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          movieItem.voteAverage.roundToDouble().toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: InkWell(
                onTap: () {
                  navigateTo(context, MoviePlayScreen(movieItem: movieItem));
                },
                child: const CustomIconButton(
                  icon: Icons.play_circle_rounded,
                  border: false,
                  text: 'Play',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
