import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:ecommerce_app/view/widget/orders/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

class CardOrederListArchive extends GetView<OrdersArchiveController> {
  final Ordersmodel listdata;
  const CardOrederListArchive({Key? key, required this.listdata})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // Text(listdata.ordersDatatime!),
                Text(
                  Jiffy.parse(listdata.ordersDatatime!).fromNow(),
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ],
            ),
            Divider(),
            Text(
              "Order Type : ${controller.printTyprOrder(listdata.orderstype!)}",
            ),
            Text("Order price : ${listdata.ordersPrice} \$"),
            Text("delivery price : ${listdata.orderspricedelivery} \$"),
            Text(
              "payment method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}",
            ),
            Text(
              "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}",
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${listdata.ordersTolotalprice} \$",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoutse.ordersdetieles,
                      arguments: {"ordersmodel": listdata},
                    );
                  },
                  child: Text("Detelis"),
                  color: AppColor.therdcolor,
                  textColor: AppColor.secoundcolor,
                ),
                if (listdata.ordersRatig! == "0")
                MaterialButton(
                  onPressed: () {
                    showDialogRating(context , listdata.ordersId!);
                  },
                  child: Text("Rating"),
                  color: AppColor.therdcolor,
                  textColor: AppColor.secoundcolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
