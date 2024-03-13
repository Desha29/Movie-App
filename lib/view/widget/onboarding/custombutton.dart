import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '/../controller/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingImplement> {
  const CustomButtonOnBoarding({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: const Color(0xffe50914),
        minWidth: 300,
        height: 48,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
