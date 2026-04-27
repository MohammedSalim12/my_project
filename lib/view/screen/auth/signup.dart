import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/alertexitapp.dart';
import 'package:ecommerce_app/core/function/vaildinput.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce_app/view/widget/auth/custontextfromauth.dart';
import 'package:ecommerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Signup extends GetView<Localecontroller> {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body:WillPopScope(
        onWillPop: alertExitApp,
        child:  GetBuilder<SignUpControllerImp>(builder: (controller) =>
         controller.statusRequest == StatusRequest.loding ? Center(child: Text("Loding...."),):
         Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: Form(
          key: controller.formstatesginup,
          child: ListView(
            children: [
              Coustemtextauthtitle(text: "2".tr),
              SizedBox(height: 10),
              Coustemtextbodyauth(textbody: "3".tr),
              SizedBox(height: 25),
              
              CustomTextFormAuth(
                isNumber: false,
                hinttext: "Enter your Email",
                iconData: Icons.email_outlined,
                labeltext: "Email",
                mycontroller: controller.email,
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
              ),
              CustomTextFormAuth(
                isNumber: false,
                hinttext: "Enter your UserName",
                iconData: Icons.person_2_outlined,
                labeltext: "UserName",
                mycontroller: controller.username,
                valid: (val) {
                  return validInput(val!, 5, 30, "username");
                },
              ),
              CustomTextFormAuth(
                isNumber: true,
                hinttext: "Enter your Phone",
                iconData: Icons.phone_outlined,
                labeltext: "Phone",
                mycontroller: controller.phone,
                valid: (val) {
                  return validInput(val!, 5, 20, "phone");
                },
              ),
              
              CustomTextFormAuth(
                onTapIcon: () {
                      controller.showPassword();
                    },
                    obsecuretext: controller.isshowpasswoed,
                isNumber: false,
                hinttext: "Enter your Passowrd",
                iconData: Icons.lock_outline,
                labeltext: "Passowrd",
                mycontroller: controller.password,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
              ),
              CustomButtomAuth(
                text: "Sign Up",
                onPressed: () {
                  controller.signup();
                },
              ),
              SizedBox(height: 20),
              TextSignupOrLogin(
                textone: "have an accout ? ",
                texttwo: " Login",
                onTap: () {
                  controller.goToLogin();
                },
              ),
            ],
          ),
        ),
      ),)
    ));
  }
}
