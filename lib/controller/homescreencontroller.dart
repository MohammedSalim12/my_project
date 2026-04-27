import 'package:ecommerce_app/view/screen/home.dart';
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
      children: [Center(child: Text("setting"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("profail"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("favorit"))],
    ),
  ];

  List listtitle = ["Home", "setting", "profile", "favorit"];

  List icondata = [
    Icons.home_outlined,
    Icons.settings_outlined,
    Icons.person_3_outlined,
    Icons.favorite_outline,
  ];
  @override
  chamgePage(int current) {
    currentpage = current;
    update();
  }
}
