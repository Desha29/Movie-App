import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/../controller/get_movies.dart';
import '/../core/constant/api_constants.dart';
import '/../data/model/movies_model.dart';
import '/../core/constant/routes.dart';
import '/../controller/moviesdata_controlletr.dart';

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
                    Get.toNamed(AppRoutes.movieTypePage,
                        arguments: [title, movies]);
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 55, 55),
                      fontSize: 12,
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
              height: 225,
              child: movies.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 237, 55, 55),
                    ))
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      itemCount: movies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            DioHelper.id = movies[index].id.toString();
                            List castList = await DioHelper().getCasts();
                            MoviesData.casts = Casts.convertToCasts(castList);
                            Get.toNamed(AppRoutes.moviepage,
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
                                  fit: BoxFit.cover),
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
