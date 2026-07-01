import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/modael/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/coustemappar.dart';
import 'package:ecommerce_app/view/widget/home/coustemcardhome.dart';
import 'package:ecommerce_app/view/widget/home/listcatergorieshome.dart';
import 'package:ecommerce_app/view/widget/home/listitemhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
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
                controller.cheksearch(val);
              },
            ),
            Handingdatacontroller(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Coustemcardhome(
                          title: "A summer suprice ",
                          body: "cashbak 20%",
                        ),
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
                        Listitemhome(),
                      ],
                    )
                  : ListItemsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<Itemsmodel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProdactDetiles(listdatamodel[index]);
          },
          child: Container(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imageitems}/${listdatamodel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].itemsDesc!),  
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
