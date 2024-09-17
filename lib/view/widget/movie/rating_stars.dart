import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.MovieStars,
  });

  final double MovieStars;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: MovieStars.roundToDouble(),
        minRating: 1,
        maxRating: 10,
        direction: Axis.horizontal,
        allowHalfRating: true,
        ignoreGestures: true,
        itemSize: 20,
        unratedColor: const Color.fromARGB(255, 53, 53, 53),
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: (rating) {});
  }
}
