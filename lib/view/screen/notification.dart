import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
        builder: (controller) => Handingdatacontroller(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "massege",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ...List.generate(
                  controller.data.length,
                  (index) => ListTile(
                    title: Text(controller.data[index]['notification_title']),
                    subtitle: Text(controller.data[index]['notification_body']),
                    trailing:Text(Jiffy.parse(controller.data[index]['notification_datetime']).fromNow(),style: TextStyle(color: AppColor.primaryColor),) ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
