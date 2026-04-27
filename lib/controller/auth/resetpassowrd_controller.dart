import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/ResetPassword.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetpassowrdController extends GetxController {
  resetPassword();
}

class ResetpassowrdControllerImp extends ResetpassowrdController {
  GlobalKey<FormState> formstaterersetpassword = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  StatusRequest? statusRequest;

  late String email;

  ResetPasswordData resetPasswordData = ResetPasswordData(Dio());

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    // استلام الإيميل من صفحة Verify Code
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    var formdata = formstaterersetpassword.currentState;

    if (formdata!.validate()) {
      if (password.text != repassword.text) {
        Get.defaultDialog(
          title: "خطأ",
          middleText: "كلمتا المرور غير متطابقتين",
        );
        return;
      }

      statusRequest = StatusRequest.loding;
      update();

      var response = await resetPasswordData.postdata(email, password.text);

      statusRequest = handlingData(response);
      update();

      if (statusRequest == StatusRequest.success) {
        if (response['state'] == "success") {
          Get.offNamed(AppRoutse.susseccResetPassword);
        } else {
          Get.defaultDialog(
            title: "خطأ",
            middleText: "حدث خطأ أثناء تغيير كلمة المرور",
          );
        }
      }
    }
  }
}
