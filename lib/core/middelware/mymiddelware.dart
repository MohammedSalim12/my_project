import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddelware extends GetMiddleware {
  int? get Priority => 1;

  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
       return RouteSettings(name: AppRoutse.home);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutse.login);
     }
      
    return null;
  }
}
