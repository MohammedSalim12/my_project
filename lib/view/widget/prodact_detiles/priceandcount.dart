import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceAndcount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndcount({Key? key, this.onAdd, this.onRemove, required this.price, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 2),
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.black),
              ),
              child: Text(count, style: TextStyle(fontSize: 20, height: 1.1)),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          "$price \$",
          style: TextStyle(
            color: AppColor.secoundcolor,
            fontSize: 20,
            fontFamily: "sans",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
