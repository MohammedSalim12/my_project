import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/vaildinput.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce_app/view/widget/auth/custontextfromauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassowrd extends GetView<Localecontroller> {
  const ForgetPassowrd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Form(
          key: controller.formtstateporgetpassword,
          child: ListView(
            children: [
              Coustemtextauthtitle(text: "Cheek Email"),
              SizedBox(height: 10),
              Coustemtextbodyauth(
                textbody:
                    "please Enter Your email addres to Recive A verification code ",
              ),
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
              SizedBox(height: 10),
              CustomButtomAuth(
                text: "cheek",
                onPressed: () {
                  controller.chekemail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
