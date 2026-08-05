import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: Itemsmodel.fromJson(controller.items[i]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomePageControllerImp> {
  final Itemsmodel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProdactDetiles(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${Applink.imageitems}/${itemsModel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 200,
          ),
          Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemsName}",
              style: const TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
