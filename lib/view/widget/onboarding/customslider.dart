import 'package:ecommerce_app/controller/onboarding_controlar.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomsliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomsliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          
          
          Image.asset(
            onboardingList[i].image!,
            width: 400,
            height: 350,
            fit: BoxFit.fill,
          ),
          SizedBox(height:25),
          Text(
            onboardingList[i].title!,
            style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          ),
          SizedBox(height: 25),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onboardingList[i].body!,
              textAlign: TextAlign.center,
              style:TextStyle(height: 2, color: AppColor.grey, fontSize: 13,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
