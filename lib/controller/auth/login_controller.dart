import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  Myservices myServices = Get.find();
  Dio dio = Dio();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData = LoginData(Dio());
  StatusRequest statusRequest = StatusRequest.none;

  bool isshowpasswoed = true;
  showPassword() {
    isshowpasswoed = isshowpasswoed == true ? false : true;
    update();
  }

  @override
  login() async {
    try {
      statusRequest = StatusRequest.loding;
      update();
      print("EMAIL: ${email.text}");
      print("PASSWORD: ${password.text}");
      print("LOGIN URL: ${Applink.login}");

      var response = await loginData.postdata(email.text, password.text);
      print("LOGIN RESPONSE: $response");

      if (response["state"] == "success") {
        statusRequest = StatusRequest.success;

        // ✅ تصحيح المسار: نقرأ القيمة مباشرة وليس داخل data
        if (response['user_approve'] == 1) {
          // الحساب مفعّل -> احفظ البيانات وروح للهوم
          myServices.sharedPreferences.setString(
            "id",
            response["user_id"].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response["user_name"],
          );
          myServices.sharedPreferences.setString(
            "email",
            response["user_email"],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response["user_phone"],
          );
          myServices.sharedPreferences.setString("step", "2");

          Get.offNamed(AppRoutse.home);
        } else {
          // الحساب غير مفعّل -> روح لصفحة إدخال كود التفعيل
          Get.toNamed(
            AppRoutse.veryficodesignup,
            arguments: {"email": email.text},
          );
        }
      } else {
        // الإيميل غلط أو الباسورد غلط
        Get.snackbar("خطأ", response["message"] ?? "بيانات خاطئة");
        statusRequest = StatusRequest.failuor;
      }
    } catch (e) {
      print("LOGIN CATCH ERROR: $e");
      statusRequest = StatusRequest.serverfailuor;
      update();
      Get.snackbar("خطأ", "فشل الاتصال بالسيرفر");
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutse.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((Value) {
      print(Value);
      String? token = Value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutse.forgetPassword);
  }
}
