import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController {
  chamgePage(int current);
}

class HomescreencontrollerImp extends Homescreencontroller {
  int currentpage = 0;

  List<Widget> listpage = [
    Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("notification"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("profail"))],
    ),
    Setting(), 
  ];

  List listtitle = ["Home", "notific", "profile", "setting"]; 

  List icondata = [
    Icons.home_outlined,
    Icons.notification_important,
    Icons.person_3_outlined,
    Icons.settings_outlined,  
  ];
  @override
  chamgePage(int current) {
    currentpage = current;
    update();
  }
}
