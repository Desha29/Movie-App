import 'package:flutter/material.dart';
import 'package:movie_app/view/screen/movie/movie_categories_screen.dart';
import 'package:movie_app/view/widget/home/image_container.dart';
import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/colors.dart';
import '../../../components/loading_widget.dart';
import '../../screen/movie/movie_details_screen.dart';

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
                      fontSize: 20,
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
                    "See more",
                    style: TextStyle(
                      color: ColorPalette.darkPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 237, 55, 55),
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 280,
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
                          child: Column(
                            children: [
                              Container(
                                width: 160,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Image_Container(
                                    imageUrl: ApiConstants.imageUrl +
                                        movies[index].posterPath,
                                    rate: movies[index]
                                        .voteAverage
                                        .roundToDouble()),
                              ),
                              Text(
                                movies[index].title,
                                maxLines: 2,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
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
