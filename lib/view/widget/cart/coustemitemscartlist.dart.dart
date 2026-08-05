import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';

class CoustemItemsCartListDart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CoustemItemsCartListDart({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${Applink.imageitems}/$imagename",
                height: 80,
                // fit: BoxFit.cover,
              ),
            ),

            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  price,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColor.secoundcolor,
                    fontFamily: "sens",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 35,
                    child: IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  ),
                  Container(
                    height: 17,
                    child: Text(
                      count,
                      style: TextStyle(
                        fontFamily: "sens",
                        fontSize: 12, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: IconButton(
                      onPressed: onRemove,
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
