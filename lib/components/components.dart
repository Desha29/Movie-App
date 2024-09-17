import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:movie_app/view/screen/onboarding_screen.dart';
import 'package:movie_app/view/screen/splash_screen.dart';

Widget start() {
  if (FirebaseAuth.instance.currentUser != null) {
    return const SplashScreen();
  } else {
    return const OnBoarding();
  }
}

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void navigateToReplacement(context, Widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
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
            const Color(0xff141414).withOpacity(0.01),
            const Color(0xff141414).withOpacity(0.3),
            const Color(0xff141414).withOpacity(0.6),
            const Color(0xff141414).withOpacity(0.9),
            const Color(0xff141414)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key, required this.message, required this.icon});
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(108, 255, 255, 255),
            size: 40,
          ),
          Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(
              color: Color.fromARGB(108, 255, 255, 255),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
