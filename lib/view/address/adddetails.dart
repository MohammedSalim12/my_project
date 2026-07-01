import 'package:ecommerce_app/controller/address/addpartdetails_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/shared/custombotton.dart';
import 'package:ecommerce_app/view/widget/auth/custontextfromauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AdressAddDetails extends StatelessWidget {
  const AdressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller = Get.put(
      AddAddressDetailsController(),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('add deta  ils address')),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) => Handingdatacontroller(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                  hinttext: "name",
                  labeltext: "name",
                  iconData: Icons.near_me,
                  mycontroller: controller.name,
                  valid: (val) {},
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hinttext: "city",
                  labeltext: "city",
                  iconData: Icons.location_city,
                  mycontroller: controller.city,
                  valid: (val) {},
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hinttext: "street",
                  labeltext: "street",
                  iconData: Icons.streetview,
                  mycontroller: controller.street,
                  valid: (val) {},
                  isNumber: false,
                ),

                CustomButton(
                  text: "Add",
                  onPressed: () {
                    controller.addAdress();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
