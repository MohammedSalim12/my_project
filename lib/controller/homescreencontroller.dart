import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/offers.dart';
import 'package:ecommerce_app/view/screen/setting.dart';
import 'package:ecommerce_app/view/screen/notification.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/widgets.dart' hide Notification;
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController {
  chamgePage(int current);
}

class HomescreencontrollerImp extends Homescreencontroller {
  int currentpage = 0;

  List<Widget> listpage = [
    Home(),
    Notification(), 
    OffersView(),
    Setting(), 
  ];

  List listtitle = ["Home", "notific", "offers", "setting"]; 

  List icondata = [
    Icons.home_outlined,
    Icons.notification_important,
    Icons.offline_bolt_outlined,
    Icons.settings_outlined,  
  ];
  @override
  chamgePage(int current) {
    currentpage = current;
    update();
  }
}
