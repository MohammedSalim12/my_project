import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/data/modael/itemsmodel.dart';
import 'package:ecommerce_app/view/widget/coustemappar.dart';
import 'package:ecommerce_app/view/widget/items/coustemlistitems.dart';
import 'package:ecommerce_app/view/widget/items/listCategoriesItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  Items({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CoustemAppar(
               onpreesIconfavorite: (){},
              titalappar: "find serche",
              onpreesIcon: () {},
              onpreesIconserrch: () {},
            ),

            /// 🔥 قائمة الكاتيجوري
            ListCategoriesItems(),
            const SizedBox(height: 10),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => Handingdatacontroller(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.Data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    controllerFav.isFavorite[controller
                            .Data[index]['items_id']] =
                        controller.Data[index]['favorite'];
                    return CoustemlistItems(
                      itemsmodel: Itemsmodel.fromJson(controller.Data[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
