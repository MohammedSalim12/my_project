import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  Dio dio = Dio();
  GlobalKey<FormState> formstatesginup = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool isshowpasswoed = true;
  late StatusRequest statusRequest;
  SignupData signupData = SignupData(Dio());

  List data = [];

  showPassword() {
    isshowpasswoed = isshowpasswoed == true ? false : true;
    update();
  }

  @override
signup() async {
  var formdata = formstatesginup.currentState;

  if (formdata!.validate()) {
    statusRequest = StatusRequest.loding;
    update();
    print("valid");
    try {
      var response = await signupData.postdata(
        username.text,
        email.text,
        password.text,
        phone.text,
      );
      print("RESPONSE: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data["state"] == "success") {
          statusRequest = StatusRequest.success;
          update();
          Get.offAllNamed(
            AppRoutse.veryficodesignup,
            arguments: {"email": email.text},
          );
        } else {
          statusRequest = StatusRequest.failuor;
          update();
          Get.snackbar("Error", response.data["message"]);
        }
      } else {
        statusRequest = StatusRequest.serverfailuor;
        update();
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailuor;
      update();
      print("Unexpected Error: $e");
    }
  } else {
    print("Not valid");
  }
}


  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    statusRequest = StatusRequest.none;

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutse.login);
  }
}
