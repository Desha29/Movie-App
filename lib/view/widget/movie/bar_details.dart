import 'package:flutter/material.dart';

import '../../../components/constant/dark_theme.dart';

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
        Text(textTitle, style: darkTheme.textTheme.labelLarge),
        const SizedBox(height: 10),
        Text(
          textData,
          style: const TextStyle(
              color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
