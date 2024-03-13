import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingImplement extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoutes.choose);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
