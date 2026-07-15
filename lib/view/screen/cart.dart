import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/view/widget/cart/coustembottomnavegationbarcart.dart';
import 'package:ecommerce_app/view/widget/cart/coustemitemscartlist.dart.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
      title: Text("My Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) => CoustemBottomNavegationbarCart(
          price: "${cartController.priceorder} \$",
          discount: "${controller.discountcoupon}%",
          shipping: "10",
          totalprice: "${cartController.getTotalPrice()} \$",
          controllercoupon: controller.controllercoupon!,
          onApplyCoupon: () { 
            controller.chekecoupon();
          },
        ),
      ), 
      body: GetBuilder<CartControllerImp>(
        builder: (Controller) => Handingdatacontroller(
          statusRequest: Controller.statusRequest,
          widget: ListView(
            children: [
        
              SizedBox(height: 10),
              TopCardCart(
                message:
                    "you have ${Controller.totlacountitems} Items in your List ",
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      Controller.data.length,
                      (index) => CoustemItemsCartListDart(
                        onAdd: () {
                          cartController.add(
                            int.parse(cartController.data[index].itemsId!),
                          );
                        },
                        onRemove: () {
                          cartController.delete(
                            int.parse(cartController.data[index].itemsId!),
                          );
                        },
                        imagename: "${cartController.data[index].itemsImage}",
                        name: "${cartController.data[index].itemsName}",
                        price: "${cartController.data[index].itemsPrice}\$",
                        count: "${cartController.data[index].countitems}",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
