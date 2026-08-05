import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/widget/coustemappar.dart';
import 'package:ecommerce_app/view/widget/offers/coustemlistoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            CoustemAppar(
              onpreesIconserrch: () {
                controller.onSearchItems();
              },
              mycontroller: controller.search!,
              onpreesIconfavorite: () {
                Get.toNamed(AppRoutse.myfavorite);
              },
              titalappar: "find serche",
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            SizedBox(height: 15),
            !controller.isSearch
                ? Handingdatacontroller(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) =>
                          CoustemlistOffer(itemsmodel: controller.items[index]),
                    ),
                  )
                : ListItemsSearch(listdatamodel: controller.listdata),
          ],
        ),
      ),
    );
  }
}
