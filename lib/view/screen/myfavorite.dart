import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/view/widget/coustemappar.dart';
import 'package:ecommerce_app/view/widget/myfavorite/coustemlistmyfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GetBuilder<MyfavoriteController>(
          builder: ((controller) => ListView(
            children: [
              // CoustemAppar(
              //   onpreesIconfavorite: () {
              //     Get.toNamed(AppRoutse.myfavorite);
              //   },
              //   titalappar: "find serche",
              // ),
              SizedBox(height: 15,),
              Handingdatacontroller(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2 , 
                    childAspectRatio: 0.7
                  ),
                  itemBuilder: (context, index) {
                    return CoustemlistMyFavoriteItems(
                      myfavoriteitemsmodel: controller.data[index],
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
