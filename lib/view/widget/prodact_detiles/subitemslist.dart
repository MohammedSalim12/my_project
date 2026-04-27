import 'package:ecommerce_app/controller/prodactdetils_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subitemslist extends GetView<ProdactdetilsControllerImp> {
  const Subitemslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.sunitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: controller.sunitems[index]["active"] == "1"
                  ? AppColor.secoundcolor
                  : Colors.white,
              border: Border.all(color: AppColor.secoundcolor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              controller.sunitems[index]["name"],
              style: TextStyle(
                color: controller.sunitems[index]["active"] == "1"
                    ? Colors.white
                    : AppColor.secoundcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
