import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Myservices myservices = Get.find();
  Dio dio = Dio();
  FavoriteData favoriteData = FavoriteData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List Data = [];

  // key = "id"
  // value => 1 or 0
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsid) async {
    var response = await favoriteData.favoriteAdd(
      itemsid,
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          message: "Item added to favorites",
        );
        // Data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
  }

  removeFavorite(int itemsid) async {
    var response = await favoriteData.favoriteRemove(
      itemsid,
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          message: "Item removed from favorites",
        );
        // Data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
  }
}
