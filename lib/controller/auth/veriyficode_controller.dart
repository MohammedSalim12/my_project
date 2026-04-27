import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycoderesetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VeriyficodeController extends GetxController {
  checkcoderesetpassword();
}

class VeriyficodeControllerImp extends VeriyficodeController {
  late TextEditingController code;
  late String email;

  StatusRequest? statusRequest;

  Verifycoderesetpassword verifyCodeData = Verifycoderesetpassword(Dio());

  @override
  void onInit() {
    code = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  checkcoderesetpassword() async {
    // تنظيف النص القادم من OtpTextField
    String raw = code.text.trim().replaceAll(" ", "");

    // التحقق من أن المستخدم كتب الكود
    if (raw.isEmpty) {
      Get.defaultDialog(title: "خطأ", middleText: "الرجاء إدخال الكود");
      return;
    }

    // التحقق من أن الكود عبارة عن أرقام فقط
    if (!RegExp(r'^[0-9]+$').hasMatch(raw)) {
      Get.defaultDialog(title: "خطأ", middleText: "الرجاء إدخال أرقام فقط");
      return;
    }

    // تحويل الكود إلى int
    int verifyCode = int.parse(raw);

    statusRequest = StatusRequest.loding;
    update();

    var response = await verifyCodeData.postdata(email, verifyCode);

    statusRequest = handlingData(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response.data['state'] == "success") {
        Get.offNamed(AppRoutse.resetPassowrd, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
          title: "خطأ",
          middleText: "الكود غير صحيح",
        );
      }
    }
  }
}
