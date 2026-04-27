import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coustemcardhome extends GetView<HomePageControllerImp> {
  final String title;
  final String body;
  const Coustemcardhome({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            top: -20,
            right:controller.land == "en" ? -20 :null,  
            left: controller.land == "ar" ? -20 : null,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(  
                color: const Color.fromARGB(255, 27, 127, 194),
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
