import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/modael/cartmodel.dart';
import 'package:ecommerce_app/data/modael/couponmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  add(int itemsid);
  delete(int itemsid);
  cartcount(int itemsid);
  view();
  chekecoupon();
  getTotalPrice();
  goToPageCheckout();
}

class CartControllerImp extends CartController {
  TextEditingController? controllercoupon;
  Myservices myservices = Get.find();
  Dio dio = Dio();
  CartData cartData = CartData(Dio());
  StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> data = [];
  double priceorder = 0.0;
  int totlacountitems = 0;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;

  @override
  add(itemsid) async {
    var response = await cartData.cartAdd(
      itemsid,
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "Notification", message: "Item added to cart");
        view();
        // Data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
  }

  @override
  delete(itemsid) async {
    var response = await cartData.cartDelete(
      itemsid,
      int.parse(myservices.sharedPreferences.getString("id")!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "Notification",
          message: "Item delete from cart",
        );
        // Data.addAll(response['data']);
        view();
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السلة فارغة");
    Get.toNamed(
      AppRoutse.checkout,
      arguments: {
        "couponid": couponid ?? "0",
        "priceorder": priceorder.toString(),
        "discountcoupon": discountcoupon.toString(),
      },
    );
  }

  @override
  chekecoupon() async {
    var response = await cartData.chekecoupon(controllercoupon!.text);
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
        update();
      } else {
        // statusRequest = StatusRequest.failuor;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Worning", "Coupon Not valid");
        update();
      }
    }
  }

  @override
  getTotalPrice() {
    return (priceorder - priceorder * discountcoupon! / 100);
  }

  @override
  cartcount(itemsid) async {
    try {
      var response = await cartData.cartcount(
        // هنا بنفحص إذا itemsid فاضي بنعطيه 0 عشان ما يقع البرنامج
        itemsid ?? 0,
        int.parse(myservices.sharedPreferences.getString("id") ?? "0"),
      );

      print("ITEMS RESPONSE: $response");
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          int countcart;
          countcart = int.tryParse(response['data'].toString()) ?? 0;
          print("====================");
          print("$countcart");
          return countcart;
        } else {
          statusRequest = StatusRequest.failuor;
          return 0;
        }
      }
    } catch (e) {
      print("Error in cartcount: $e");
      return 0;
    }
  }

  @override
  view() async {
    try {
      var response = await cartData.cartview(
        int.parse(myservices.sharedPreferences.getString("id")!),
      );

      print("ITEMS RESPONSE: $response");
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          List dataresponse = response["datacart"];

          // تنظيف القائمة القديمة مهم جداً قبل الإضافة
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)).toList());

          priceorder = double.parse(response["countprice"].toString());
          totlacountitems = int.parse(response["totalcount"].toString());
          // -------------------------------------------------------

          update(); // الآن سيعمل ويرسم الواجهة
        } else {
          statusRequest = StatusRequest.failuor;
        }
      }
    } catch (e) {
      print("Error in cart view: $e"); // لو حصل خطأ هون رح يطبعله
    }
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
