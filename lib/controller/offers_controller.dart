import 'package:dio/dio.dart';
import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  Myservices myservices = Get.find();
  OffersData offersData = OffersData(Dio());
  StatusRequest statusRequest = StatusRequest.loding;
  List<Itemsmodel> items = [];

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loding;

    var response = await offersData.getData();
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List resonsedata1 = response['data'];
        items.addAll(resonsedata1.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }
}
