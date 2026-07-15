import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/cart/buttomCart.dart';
import 'package:ecommerce_app/view/widget/cart/custombuttoncupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustemBottomNavegationbarCart extends GetView<CartControllerImp> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const CoustemBottomNavegationbarCart({
    Key? key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.totalprice,
    required this.controllercoupon,
    this.onApplyCoupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartControllerImp>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              hintText: "Coupon Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CoustombuttomCoupon(
                            textbuttom: "apply",
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      "Coupon Code ${controller.couponname!}",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Price ", style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        price,
                        style: TextStyle(fontSize: 16, fontFamily: "sens"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("shipping ", style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        shipping,
                        style: TextStyle(fontSize: 16, fontFamily: "sens"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("discount ", style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        discount,
                        style: TextStyle(fontSize: 16, fontFamily: "sens"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(color: AppColor.black),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Total Price ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        totalprice,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sens",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CoustombuttomOrder(
            textbuttom: " Order",
            onPressed: () {
              controller.goToPageCheckout();
            },
          ),
        ],
      ),
    );
  }
}
