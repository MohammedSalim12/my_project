import 'package:ecommerce_app/controller/homescreencontroller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/home/coustembuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {},
          child: Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listpage.length + 1, ((index) {
               int i = index > 1 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : Coustembuttomappar(
                        textbuttom:
                            controller.listtitle[i],
                        icondata:
                            controller.icondata[i],
                        onPressed: () {
                          controller.chamgePage(i);
                        },
                        activity: controller.currentpage == i ? true : false,
                      );
              })),
            ],
          ),
        ),
        body: controller.listpage.elementAt(controller.currentpage),
      ),
    );
  }
}
