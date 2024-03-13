import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String texttitle;
  final String textbody;
  const CustomTextBodyAuth({
    super.key,
    required this.texttitle,
    required this.textbody,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          texttitle,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(229, 9, 20, 1)),
        ),
        Text(
          textbody,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ]),
    );
  }
}
