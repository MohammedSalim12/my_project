import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce_app/view/widget/checkout/cardpaymentMethod.dart';
import 'package:ecommerce_app/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(title: const Text('checkout')),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secoundcolor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => Handingdatacontroller(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Text(
                  "choose payment Method :",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("0"); // cash
                  },
                  child: CardpaymentMethod(
                    title: "Cash On Delivery",
                    isActive: controller.paymentMethod == "0" ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1"); //card  
                  },
                  child: CardpaymentMethod(
                    title: "Payment Cards",
                    isActive: controller.paymentMethod == "1" ? true : false,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "choose Delivery Type :",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("0"); //delivrey
                      },
                      child: CarddeliVeryTypeCheckout(
                        title: "Delivery",
                        imagename: AppImageasset.delivery2,
                        active: controller.deliverytype == "0"
                            ? true
                            : false,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1"); //Drivethru
                      },
                      child: CarddeliVeryTypeCheckout(
                        title: "Drive thru",
                        imagename: AppImageasset.drivethru,
                        active: controller.deliverytype == "1"
                            ? true
                            : false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (controller.deliverytype == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Address :",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                              controller.dataaddress[index].addressId!,
                            );
                          },
                          child: Cardshippingaddress(
                            title:
                                "${controller.dataaddress[index].addressName}",
                            body:
                                "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                            isactive:
                                controller.addressId ==
                                    controller.dataaddress[index].addressId
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
