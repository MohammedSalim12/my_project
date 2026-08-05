import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AdressviewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loding;
  AddressData Addressdata = AddressData(Dio());
  Myservices myservices = Get.find();
  List<AddressModel> data = [];

  deleteAddress(String addressid) {
    Addressdata.DeleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getAdress() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await Addressdata.getData(
      myservices.sharedPreferences.getString("id")!,
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failuor;
        }
      } else {
        statusRequest = StatusRequest.serverfailuor;
      }
    }
    update();
  }

  @override
  void onInit() {
    getAdress();
    super.onInit();
  }
}
