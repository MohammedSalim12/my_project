import 'package:ecommerce_app/controller/auth/successresetpassword_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SuccessResetPasswoed extends StatelessWidget {
  const SuccessResetPasswoed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessresetpasswordControllerImp controller = Get.put(
      SuccessresetpasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '32'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: Colors.green,
              ),
            ),
            Text("... Success go to Login -->", style: TextStyle(fontSize: 20)),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "Go To Login",
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
