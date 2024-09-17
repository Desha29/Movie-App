import 'package:flutter/material.dart';

import '../../../components/constant/colors.dart';

class BarDetails extends StatelessWidget {
  final String textTitle;
  final String textData;
  const BarDetails(
      {super.key, required this.textTitle, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(textTitle,
            style: const TextStyle(color: ColorPalette.darkPrimary, fontSize: 16,fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(
          textData,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
