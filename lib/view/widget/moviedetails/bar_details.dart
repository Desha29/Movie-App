import 'package:flutter/material.dart';

class BarDetails extends StatelessWidget {
  final String textTitle;
  final String textData;
  const BarDetails(
      {super.key, required this.textTitle, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: const TextStyle(
              color: Color(0xffe50914),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          textData,
          style: const TextStyle(
              color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
