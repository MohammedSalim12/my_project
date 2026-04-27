import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 90,
        backgroundColor:Color.fromARGB(255, 0, 103, 246),
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageasset.logo,
            ),
          ),
        ));
  }
}
