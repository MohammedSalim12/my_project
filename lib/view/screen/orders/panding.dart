import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Container(
        child: GetBuilder<PendingController>(
          builder: (controller) => Handingdatacontroller(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context, index) =>
                  CardOrederList(listdata: controller.data[index])),
            ),
          ),
        ),
      ),
    );
  }
}
