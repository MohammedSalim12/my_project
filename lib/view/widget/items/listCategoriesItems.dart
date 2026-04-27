import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/translatedatabase.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends StatelessWidget {
  final int? i;
  const ListCategoriesItems({Key? key, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ItemsControllerImp controller = Get.find();
    return SizedBox(
      height: 90 ,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.changCat(index);
              controller.getitems(controller.categories[index]['categories_id']); // جلب البيانات
            },
            child: Column(
              children: [
                GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
                  decoration: controller.selectedCat == index
                      ? BoxDecoration(
                          border: Border(   
                            bottom: BorderSide(
                              width: 3,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        )
                      : null,
                  child: Text(
                    "${translateDataBase(controller.categories[index]['categories_name_ar'],controller.categories[index]['categories_name'])}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),)
              ],
            ),
          );
        },
      ),
    );
  }
}
