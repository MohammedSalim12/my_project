import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Coustembuttomappar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbuttom;
  final IconData icondata;
  final bool activity ;
  const Coustembuttomappar({
    Key? key,
    required this.textbuttom,
    required this.icondata,
    required this.onPressed,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icondata, color : activity == true ? AppColor.primaryColor : Colors.black),
            Text(
              textbuttom,
              style: TextStyle(fontSize: 12, color: activity == true ? AppColor.primaryColor :Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
