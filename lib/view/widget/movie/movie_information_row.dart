import 'package:flutter/material.dart';
import 'bar_details.dart';

class MovieInformationRow extends StatelessWidget {
  const MovieInformationRow({
    super.key,
    required this.language,
    required this.year,
    required this.rating,
  });

  final String language;
  final String year;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BarDetails(textTitle: "Language", textData: language),
          BarDetails(textTitle: "Release Date", textData: year),
          BarDetails(textTitle: "Rating", textData: rating),
        ],
      ),
    );
  }
}
