import 'package:flutter/material.dart';
import 'package:movie_app/view/screen/movie/movie_categories_screen.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/colors.dart';
import '../../screen/movie/movie_details_screen.dart';
import 'movie_card.dart';

class MovieRow extends StatelessWidget {
  MovieRow({super.key, required this.title, required this.movies});
  final String title;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      MovieTypePage(movies: movies, title: title),
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: ColorPalette.darkPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decorationColor: Color.fromARGB(255, 237, 55, 55),
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: movies.isEmpty
                  ? const LoadingWidget()
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      itemCount: movies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            navigateTo(context,
                                MovieDetails(movieItem: movies[index]));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Container(
                                  width: 170,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: MovieCard(
                                      imageUrl: ApiConstants.imageUrl +
                                          movies[index].posterPath,
                                      rate: movies[index]
                                          .voteAverage
                                          .roundToDouble()),
                                ),
                                Text(
                                  movies[index].title,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
