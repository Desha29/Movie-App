import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '/../controller/onboarding_controller.dart';
import '/../data/datasource/static/static.dart';

class ControllerOnBoarding extends StatelessWidget {
  const ControllerOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingImplement>(
      builder: (controller) => Row(
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(left: 5),
                    duration: const Duration(milliseconds: 300),
                    height: 5,
                    width: controller.currentPage == index ? 25 : 5,
                    decoration: BoxDecoration(
                        color: const Color(0xffABA4A2),
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
