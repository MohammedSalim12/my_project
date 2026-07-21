import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  Myservices myservices = Get.find();
  @override
  logout() {
    String userid = myservices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutse.login);
  }
}
