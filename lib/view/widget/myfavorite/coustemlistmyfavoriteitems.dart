import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/translatedatabase.dart';
import 'package:ecommerce_app/data/modael/favoritemodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustemlistMyFavoriteItems extends GetView<MyfavoriteController> {
  final myFavoriteModel myfavoriteitemsmodel;
  const CoustemlistMyFavoriteItems({
    Key? key,
    required this.myfavoriteitemsmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageProdactDetiles(itemsmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myfavoriteitemsmodel.itemsImage == null
                  ? const Icon(
                      Icons.image_not_supported,
                      size: 60,
                      color: Colors.grey,
                    )
                  : Hero(
                      tag: "${myfavoriteitemsmodel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imageitems}/${myfavoriteitemsmodel.itemsImage}",
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
                "${translateDataBase(myfavoriteitemsmodel.itemsNameAr, myfavoriteitemsmodel.itemsName)}",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${translateDataBase(myfavoriteitemsmodel.itemsDescAr, myfavoriteitemsmodel.itemsDesc)}",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${myfavoriteitemsmodel.itemsPrice}\$",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromMyFAvorite(
                       int.parse(myfavoriteitemsmodel.favoriteId!),
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
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
