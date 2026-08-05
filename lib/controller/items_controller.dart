import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/datasource/remote/items_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changCat(int val);
  getitems(int categoriesid);
  goToPageProdactDetiles(Itemsmodel itemsmodel);
  cheksearch(val);
  onSearchItems();
  searchData();
}

class ItemsControllerImp extends ItemsController {
  Myservices myservices = Get.find();
  Dio dio = Dio();
  ItemsData itemsData = ItemsData(Dio());
  HomeData homeData = HomeData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List Data = [];
  List categories = [];
  bool isSearch = false;
  int? selectedCat;
  int? catId;
  TextEditingController? search;
  List<Itemsmodel> listdata = [];
  int deliverytime = 0;

  @override
  void onInit() {
    search = TextEditingController();
    print("📌 ARGUMENTS INSIDE CONTROLLER: ${Get.arguments}");
    super.onInit();
    Future.delayed(Duration(milliseconds: 300), () {
      intialData();
      Get.put(this, permanent: true);
    });
  }

  @override
  intialData() async {
    deliverytime = myservices.sharedPreferences.getInt(deliverytime.toString())!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    await Future.delayed(Duration(milliseconds: 300));
    update();
    getitems(catId!);
  }

  @override
  changCat(val) {
    if (selectedCat == val) return; // 🔥 منع إعادة نفس الطلب
    selectedCat = val;
    update();
  }

  @override
  getitems(categoriesid) async {
    // 🔥 أول شيء: إذا نفس الكاتيجوري → لا تعمل شيء
    if (catId == categoriesid) return;
    // 🔥 بعدها حدّث catId
    catId = categoriesid;
    // 🔥 بعدها امسح البيانات
    Data.clear();
    // 🔥 بعدها ضع الحالة لودينغ
    statusRequest = StatusRequest.loding;
    update();
    // 🔥 الآن نفّذ الطلب
    var response = await itemsData.getData(
      categoriesid,
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  //====================================
  @override
  goToPageProdactDetiles(itemsmodel) {
    Get.toNamed(
      AppRoutse.prodactdetiles,
      arguments: {"itemsmodel": itemsmodel},
    );
  }

  @override
  cheksearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  @override
  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  searchData() async {
    statusRequest = StatusRequest.loding;
    update();

    var response = await homeData.searchData(search!.text);
    print("HOME RESPONSE: $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }

    update();
  }
}
