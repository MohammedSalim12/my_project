import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce_app/data/model/favoritemodel.dart';
import 'package:get/get.dart';

class MyfavoriteController extends GetxController {
  Myservices myservices = Get.find();
  Dio dio = Dio();
  MyfavoriteData favoriteData = MyfavoriteData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List<myFavoriteModel> data = [];

  // key = "id"
  // value => 1 or 0

  getData() async {
    var response = await favoriteData.getData(
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List resonsedata = response['data'];
        data.addAll(resonsedata.map((e) => myFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  deleteFromMyFAvorite(int favoriteid) async {
    var response = await favoriteData.deleteData((favoriteid));
    print("ITEMS RESPONSE: $response");
    if (response['status'] == "success") {
      data.removeWhere((element) => element.favoriteId == favoriteid);
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
