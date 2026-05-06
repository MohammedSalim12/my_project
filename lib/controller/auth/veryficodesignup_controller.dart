import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VeriyficodeSginUpController extends GetxController {
  checkcode();
  goToSuccessSignUp();
  resend();
}

class VeriyficodeSginUpControllerImp extends VeriyficodeSginUpController {
  late TextEditingController email; // الإيميل القادم من صفحة signup
  String code = ""; // الكود القادم من OTP widget
  VerifycodesignupData verifycodesignupData = VerifycodesignupData(Dio());
  late StatusRequest statusRequest;

  Dio dio = Dio();

  @override
  checkcode() async {
    try {
      statusRequest = StatusRequest.loding;
      update();
      var response = await verifycodesignupData.postdata(email.text, code);
      print("RESPONSE: ${response.data}");

      if (response.statusCode == 200) {
        goToSuccessSignUp();
      }
    } catch (e) {
      Get.snackbar("خطأ", "الكود غير صحيح أو حدث خطأ في الاتصال");
      statusRequest = StatusRequest.serverfailuor;
    }
    update();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutse.successSingUp);
  }

  @override
  void onInit() {
    email = Get.arguments["email"]; // جاي من صفحة signup
    super.onInit();
  }

  @override
  resend() {  
    verifycodesignupData.resendData(email.text);
  }
}
