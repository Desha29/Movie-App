import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/constant/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool border;
  final double? width;
  final double? height;

  const CustomIconButton({
    super.key,
    required this.text,
    this.icon,
    required this.border,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: height ?? 38,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: border
          ? buildOutlinedBoxDecoration(context: context)
          : buildFilledBoxDecoration(context: context),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildFilledBoxDecoration(
      {required BuildContext context, double? radius, Color? color}) {
    return BoxDecoration(
        color: ColorPalette.darkPrimary,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ]);
  }

  BoxDecoration buildOutlinedBoxDecoration(
      {required BuildContext context, double? radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 15),
        border: Border.all(width: 2, color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ]);
  }
}
