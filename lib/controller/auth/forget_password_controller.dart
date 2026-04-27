import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/ForgetPasswordData.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  chekemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formtstateporgetpassword = GlobalKey<FormState>();
  late TextEditingController email;

  StatusRequest? statusRequest;

  Forgetpassworddata forgetPasswordData = Forgetpassworddata(Dio());

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  chekemail() async {
    var formdata = formtstateporgetpassword.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      update();

      var response = await forgetPasswordData.postdata(email.text);

      statusRequest = handlingData(response);
      update();

      if (statusRequest == StatusRequest.success) {
        if (response.data['state'] == "success") {
          // ننتقل لصفحة الكود
          Get.offNamed(AppRoutse.verfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "تنبيه", middleText: "الإيميل غير موجود");
        }
      }
      update();
    } else {
      print("not valid");
    }
  }
}
