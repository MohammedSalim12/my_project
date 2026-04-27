import 'package:ecommerce_app/controller/auth/resetpassowrd_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/vaildinput.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce_app/view/widget/auth/custontextfromauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends GetView<Localecontroller> {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetpassowrdControllerImp controller = Get.put(
      ResetpassowrdControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reset password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: Form(
          key: controller.formstaterersetpassword,
          child: ListView(
            children: [
              Coustemtextauthtitle(text: "New password"),
              SizedBox(height: 10),
              Coustemtextbodyauth(textbody: "Plaese Enter new Password "),
              SizedBox(height: 25),
              CustomTextFormAuth(
                isNumber: false,
                hinttext: "Enter your Password",
                iconData: Icons.lock_outline,
                labeltext: "Password",
                valid: (val){
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.password,
              ),
              CustomTextFormAuth(
                isNumber: false,
                hinttext: "Re Enter your Password",
                iconData: Icons.lock_outline,
                labeltext: "Password",
                mycontroller: controller.repassword,
                valid: (val){
                  return validInput(val!, 5, 30, "password");
                },
              ),
              SizedBox(height: 20),
              CustomButtomAuth(
                text: "Save",
                onPressed: () {
                  controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
