import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/prodactdetils_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TopPageProdactDetiles extends GetView<ProdactdetilsControllerImp> {
  const TopPageProdactDetiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
        ),
        Positioned(
          top: 40.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsmodel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${Applink.imageitems}/${controller.itemsmodel.itemsImage!}",
              height: 210,
              width: 400,
            ),
          ),
        ),
      ],
    );
  }
}
