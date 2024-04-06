import 'package:flutter/material.dart';
import 'package:movie_app/components/components.dart';
import '../../widget/movie/movie_container.dart';
import '../search_screen.dart';

// ignore: must_be_immutable
class MovieTypePage extends StatelessWidget {
  MovieTypePage({super.key, required this.movies, required this.title});
  List movies;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.white),
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
                onTap: () {
                  navigateTo(context, const SearchPage());
                },
                child: const Icon(Icons.search, size: 30)),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieContainer(
                movieItem: movies[index],
              );
            }),
      ),
    );
  }
}
