import 'package:flutter/material.dart';
import '/../view/widget/grandientcolors.dart';
import '/../view/widget/moviedetails/rating_stars.dart';

class MovieRoundImage extends StatelessWidget {
  MovieRoundImage({
    super.key,
    required this.MovieImage,
    required this.Moviename,
    required this.Rating,
    required this.Stars,
  });
  final String MovieImage;
  final String Moviename;
  final String Rating;
  final double Stars;
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
            child: Image.network(MovieImage, fit: BoxFit.cover),
          ),
        ),
        GrandientColor(height: 200, top: 0, bottom: 0),
        Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline,
                  color: Color.fromARGB(96, 158, 158, 158), size: 40),
            )),
        Positioned(
          bottom: 45,
          left: 20,
          child: Text(
            Moviename,
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
                  Rating,
                  style: TextStyle(
                      color: Color.fromARGB(255, 90, 95, 151),
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 5,
                ),
                RatingStars(MovieStars: Stars),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
