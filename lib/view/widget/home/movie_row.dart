import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../components/components.dart';
import '../../../components/constant/api_constants.dart';
import '../../../components/constant/imageassets.dart';
import '../../../components/constant/routes.dart';
import '../../../components/loading_widget.dart';

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
                    navigateTo(context, AppRoutes.movieTypePage,
                        arguments: [title, movies]);
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 55, 55),
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
            child: SizedBox(
              height: 240,
              child: movies.isEmpty
                  ? const LoadingWidget()
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      itemCount: movies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            onTap: () async {
                              navigateTo(context, AppRoutes.moviepage,
                                  arguments: [index, movies]);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  ApiConstants.imageUrl +
                                      movies[index].posterPath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(AppImageAssets.noImage);
                                  },
                                ),
                              ),
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
