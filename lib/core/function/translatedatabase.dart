import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

translateDataBase(columar, columen) {
  Myservices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return columar;
  } else {
    return columen;
  }
}
