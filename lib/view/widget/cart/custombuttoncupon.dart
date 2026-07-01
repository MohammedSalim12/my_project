import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CoustombuttomCoupon extends StatelessWidget {
  final String textbuttom;
  final void Function()? onPressed;
  const CoustombuttomCoupon({Key? key, required this.textbuttom, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 70),
            width: double.infinity,
            child: MaterialButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: onPressed,
              child: Text(
                textbuttom,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
