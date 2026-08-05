import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loding;
  String? lat;
  String? long;
  AddressData Addressdata = AddressData(Dio());
  Myservices myservices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);

    statusRequest = StatusRequest.success;
    update();
  }

  addAdress() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await Addressdata.AddData(
      myservices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutse.home);
        Get.snackbar("Worning", "Now , you can add address and select this order address");
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
