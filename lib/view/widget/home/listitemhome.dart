import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/data/modael/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listitemhome extends StatelessWidget {
  const Listitemhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Handingdatacontroller(
        statusRequest: controller.statusRequest,
        widget: SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: controller.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.network(
                      "${Applink.imageitems}/${Itemsmodel.fromJson(controller.items[i]).itemsImage ?? ""}",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 110,
                    width: 110,
                  ),
                  Positioned(
                    left: 2,
                    child: Text(
                      "Laptob safrey ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
