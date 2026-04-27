import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Handingdatacontroller extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handingdatacontroller({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loding
        ? Center(
            child: Lottie.asset(AppImageasset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailuor
        ? Center(
            child: Lottie.asset(AppImageasset.offline, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.serverfailuor
        ? Center(
            child: Lottie.asset(AppImageasset.offline, width: 250, height: 250),
          )
        : widget;
  }
}
