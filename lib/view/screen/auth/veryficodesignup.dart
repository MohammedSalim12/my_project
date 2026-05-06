import 'package:ecommerce_app/controller/auth/veryficodesignup_controller.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VeryfiCodeSignUp extends GetView<Localecontroller> {
  const VeryfiCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VeriyficodeSginUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VeriyficodeSginUpControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loding
            ? Center(child: Text("Loding...."))
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: ListView(
                  children: [
                    Coustemtextauthtitle(text: "Cheek Code"),
                    SizedBox(height: 10),
                    Coustemtextbodyauth(
                      textbody:
                          "plaese enter The Digit Code Sent To ${controller.email}",
                    ),
                    SizedBox(height: 25),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(10),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.code = verificationCode; // خزّن الكود
                        controller.checkcode(); // ابعت الكود للسيرفر
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        controller.resend();
                      },
                      child: Center(
                        child: Text(
                          "resend verfiy code ",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
