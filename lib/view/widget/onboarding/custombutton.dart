import 'package:ecommerce_app/controller/onboarding_controlar.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustombuttonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustombuttonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(58)),
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text("Continue"),
        onPressed: () {
          controller.next();
        },
      ),
    );
  }
}
