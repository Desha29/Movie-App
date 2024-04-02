import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:movie_app/view/screen/auth/login_screen.dart';
import 'package:movie_app/view/screen/spalsh_screen.dart';

Widget start() {
  if (FirebaseAuth.instance.currentUser != null) {
    return const SplashScreen();
  } else {
    return const LoginScreen();
  }
}

void navigateTo(context, String route, {List<Object>? arguments}) =>
    Navigator.pushNamed(context, route, arguments: arguments);
void showToast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Colors.white,
      textColor: color,
      fontSize: 16.0,
    );

validInput(String value, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not valid email";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(value)) {
      return "Not valid Input enter numbers only";
    }
  }
  if (value.isEmpty) {
    return "can't be Empty!";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be larger than $max";
  }
}

class GradientColor extends StatelessWidget {
  const GradientColor({
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
