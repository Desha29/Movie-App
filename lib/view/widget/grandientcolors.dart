import 'package:flutter/material.dart';

class GrandientColor extends StatelessWidget {
  const GrandientColor({
    super.key,
    required this.height,
    required this.top,
    required this.bottom,
  });
  final double height;
  final double top;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(stops: const [
            0.1,
            0.3,
            0.5,
            0.7,
            0.9
          ], colors: [
            Color(0xff1c1c1c).withOpacity(0.01),
            Color(0xff1c1c1c).withOpacity(0.3),
            Color(0xff1c1c1c).withOpacity(0.6),
            Color(0xff1c1c1c).withOpacity(0.9),
            Color(0xff1c1c1c)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
