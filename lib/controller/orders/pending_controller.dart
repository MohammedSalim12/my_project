import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommerce_app/data/modael/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PendingController extends GetxController {
  Myservices myservices = Get.find();
  PendingData pendingData = PendingData(Dio());
  StatusRequest statusRequest = StatusRequest.loding;
  List<Ordersmodel> data = [];

  String printTyprOrder(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Drive Thru";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The order is bening prapered";
    } else if (val == "2") {
      return "in the way";
    } else {
      return "Archive";
    }
  }

  getOrder() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await pendingData.getData(
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Ordersmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  refreshOrder() {
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
