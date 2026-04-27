import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/translatedatabase.dart';
import 'package:ecommerce_app/data/modael/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustemlistItems extends GetView<ItemsControllerImp> {
  final Itemsmodel itemsmodel;
  const CoustemlistItems({Key? key, required this.itemsmodel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProdactDetiles(itemsmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              itemsmodel.itemsImage == null
                  ? const Icon(
                      Icons.image_not_supported,
                      size: 60,
                      color: Colors.grey,
                    )
                  : Hero(
                      tag: "${itemsmodel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imageitems}/${itemsmodel.itemsImage}",
                        width: 110,
                        height: 100,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
              Text(
                "${translateDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${translateDataBase(itemsmodel.itemsDescAr, itemsmodel.itemsDesc)}",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsmodel.itemsPrice}\$",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),

                  GetBuilder<FavoriteController>(
                    builder: (controllerFav) => IconButton(
                      onPressed: () {
                        if (controllerFav.isFavorite[itemsmodel.itemsId] ==
                            "1") {
                          controllerFav.setFavorite(itemsmodel.itemsId, "0");
                          controllerFav.removeFavorite(
                            int.parse(itemsmodel.itemsId!),
                          );
                        } else {
                          controllerFav.setFavorite(itemsmodel.itemsId, "1");
                          controllerFav.addFavorite(
                            int.parse(itemsmodel.itemsId!),
                          );
                        }
                      },
                      icon: Icon(
                        controllerFav.isFavorite[itemsmodel.itemsId] == "1"
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
