import 'package:dio/dio.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/modael/categiorsmmodel.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int categoriesid);
}

class HomePageControllerImp extends HomePageController {
  Myservices myservices = Get.find();
  Dio dio = Dio();
  HomeData homeData = HomeData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  String? username;
  String? id;
  String? land;
  List categories = [];
  List items = [];

  @override
  initialData() {
    land = myservices.sharedPreferences.getString("lang");
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loding;
    update();

    var response = await homeData.getData();
    print("HOME RESPONSE: $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }

    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoriesid) {
    Get.delete<ItemsControllerImp>();
    Get.put(ItemsControllerImp());
    Get.toNamed(
      AppRoutse.items,
      arguments: {
        "categories": categories,
        "selectedCat": selectedCat,
        "catId": categoriesid,
      },
    );
  }
}
