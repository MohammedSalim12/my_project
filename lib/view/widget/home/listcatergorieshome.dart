import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/function/translatedatabase.dart';
import 'package:ecommerce_app/data/model/categiorsmmodel.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

 
class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
  controller.categories,
  i,
  int.parse(categoriesModel.categoriesId.toString()),
);

      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 166, 203, 233),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              "${Applink.imagecategoris}/${categoriesModel.categoriesImage}",
              fit: BoxFit.cover,
            ),
          ),
          Text("${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}"),
        ],
      ),
    );
  }
}

