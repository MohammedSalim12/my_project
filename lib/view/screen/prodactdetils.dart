import 'package:ecommerce_app/controller/prodactdetils_controller.dart'
    show ProdactdetilsControllerImp;
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/prodact_detiles/priceandcount.dart';
import 'package:ecommerce_app/view/widget/prodact_detiles/subitemslist.dart';
import 'package:ecommerce_app/view/widget/prodact_detiles/toppageprodactdetiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Prodactdetils extends StatelessWidget {
  const Prodactdetils({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProdactdetilsControllerImp controller = Get.put(
      ProdactdetilsControllerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          color: AppColor.primaryColor,
          onPressed: () {},
          child: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            TopPageProdactDetiles(),
            SizedBox(height: 70),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.itemsmodel.itemsName}",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColor.black),
                    ),
                    PriceAndcount(
                      onAdd: () {},
                      onRemove: () {},
                      price: "200.0",
                      count: "3",
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${controller.itemsmodel.itemsDesc} ${controller.itemsmodel.itemsDesc}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColor.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "color",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColor.black),
                    ),
                    SizedBox(height: 8),
                    Subitemslist(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
