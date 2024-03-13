import 'package:flutter/material.dart';
import '/../data/model/onboardingmodel.dart';

import '../grandientcolors.dart';

class CustomTitleAuth extends StatelessWidget {
  final String text;
  final String image;
  const CustomTitleAuth({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.image,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: height / 2.8,
          width: width,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 20,
          top: 90,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: OnBoardingModel.logo,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xffe50914)),
            )
          ])),
        ),
        GrandientColor(top: 120, height: 200, bottom: -10)
      ],
    );
  }
}
