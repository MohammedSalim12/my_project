import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnboardingControlar extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnboardingControlar {
  late PageController pageController;

  int currentoage = 0;

  Myservices myservices = Get.find();
  @override
  next() {
    currentoage++;
    if (currentoage > onboardingList.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutse.login);
    } else {
      pageController.animateToPage(
        currentoage,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentoage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
