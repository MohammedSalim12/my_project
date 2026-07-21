import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Myservices myservices = Get.find();
  Dio dio = Dio();
  NotificationData notificationData = NotificationData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await notificationData.getData(
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success){
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
