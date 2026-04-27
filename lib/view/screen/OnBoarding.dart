import 'package:ecommerce_app/controller/onboarding_controlar.dart';
import 'package:ecommerce_app/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce_app/view/widget/onboarding/customslider.dart';
import 'package:ecommerce_app/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: CustomsliderOnBoarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotcontrollerOnBorading(),
                  SizedBox(height: 50),
                  CustombuttonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
