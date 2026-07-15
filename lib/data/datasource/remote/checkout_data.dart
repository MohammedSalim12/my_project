import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class CheckoutData {
  Dio dio;
  CheckoutData(this.dio);

  checkout(Map data) async {
    var response = await dio.post(
      Applink.checkout,
      queryParameters: {
        "usersid": data["usersid"],
        "addressid": data["addressid"],
        "orderstype": data["orderstype"],
        "pricedelivery": data["pricedelivery"],
        "ordersprice": data["ordersprice"],
        "couponid": data["couponid"],
        "coupondiscount": data["discountcoupon"],
        "paymentmethod": data["paymentmethod"],
      },
    );
    return response.data;
  }
}
