import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/coustemappar.dart';
import 'package:ecommerce_app/view/widget/home/coustemcardhome.dart';
import 'package:ecommerce_app/view/widget/home/listcatergorieshome.dart';
import 'package:ecommerce_app/view/widget/home/listitemhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Handingdatacontroller(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              CoustemAppar(
                onpreesIconfavorite: () {
                  Get.toNamed(AppRoutse.myfavorite);
                },
                titalappar: "find serche",
              ),
              Coustemcardhome(title: "A summer suprice ", body: "cashbak 20%"),
              // القسم التاني
              ListCategoriesHome(),
              Text(
                "prodact for you",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Listitemhome(), // <---------------------- اضافة
            ],
          ),
        ),
      ),
    );
  }
}
