import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardpaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardpaymentMethod({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secoundcolor:AppColor.therdcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          
          color:isActive == true ? Colors.white:AppColor.secoundcolor,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
