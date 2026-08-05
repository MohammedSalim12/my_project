import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Dio());
  CheckoutData checkoutData = CheckoutData(Dio());
  Myservices myservices = Get.find();
  List<AddressModel> dataaddress = [];

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliverytype;
  String addressId = "0";
  late String couponid;
  late String priceorder;
  late String coupondisvount;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliverytype = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loding;
    update();

    var response = await addressData.getData(
      myservices.sharedPreferences.getString("id")!,
    );
    print("HOME RESPONSE: $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List Listdata = response['data'];
        dataaddress.addAll(Listdata.map((e) => AddressModel.fromJson(e)));
        addressId = dataaddress[0].addressId.toString();  
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }

    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "plase sleect a  payment methid");
    }
    if (deliverytype == null) {
      return Get.snackbar("Error", "plase sleect a  order Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "plase sellect Shipping Address");
    }

    statusRequest = StatusRequest.loding;
    update();

    Map data = {
      "usersid": myservices.sharedPreferences.getString("id"),
      "addressid": addressId.toString(),
      "orderstype": deliverytype.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorder,
      "couponid": couponid,
      "discountcoupon": coupondisvount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("HOME RESPONSE: $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutse.home);
        Get.snackbar("success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("error", "try again");
      }
    }

    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    coupondisvount = Get.arguments['discountcoupon'];
    getShippingAddress();
    super.onInit();
  }
}
