import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CarddeliVeryTypeCheckout extends StatelessWidget {
  final bool active;
  final String imagename;
  final String title;
  const CarddeliVeryTypeCheckout({Key? key, required this.active, required this.imagename, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        color:active == true ? AppColor.secoundcolor: null,
        border: Border.all(color: AppColor.secoundcolor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagename, width: 60),
          Text(
            title,
            style: TextStyle(
              color:active == true? Colors.white:AppColor.secoundcolor,
              fontWeight:active == true? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
