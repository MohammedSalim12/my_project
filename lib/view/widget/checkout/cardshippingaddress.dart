import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Cardshippingaddress extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  const Cardshippingaddress({Key? key, required this.title, required this.body, required this.isactive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:isactive == true? AppColor.secoundcolor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color:isactive == true ? Colors.white: null, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          body,
          style: TextStyle(color:isactive == true? Colors.white: null, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
