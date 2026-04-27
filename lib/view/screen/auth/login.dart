import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/alertexitapp.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/function/vaildinput.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:ecommerce_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce_app/view/widget/auth/custontextfromauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:ecommerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Login extends GetView<Localecontroller> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => Handingdatacontroller(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    Logoauth(),
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
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      obsecuretext: controller.isshowpasswoed,
                      isNumber: false,
                      hinttext: "Enter your Password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      mycontroller: controller.password,
                      valid: (val) {
                        return validInput(val!, 5, 30, "passwrod");
                      },
                    ),

                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "Forget Password",
                        textAlign: TextAlign.right,
                      ),
                    ),
                    CustomButtomAuth(
                      text: "Login",
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: 20),
                    TextSignupOrLogin(
                      textone: "Don't have an account ? ",
                      texttwo: "SignUp ",
                      onTap: () {
                        controller.goToSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
