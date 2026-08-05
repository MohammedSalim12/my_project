import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Container(
        child: GetBuilder<OrdersArchiveController>(
          builder: (controller) => Handingdatacontroller(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context, index) =>
                  CardOrederListArchive(listdata: controller.data[index])),
            ),
          ),
        ),
      ),
    );
  }
}
