import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/handingdatacontrolleer.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderdetielesController extends GetxController {
  late Ordersmodel ordersmodel;

  Completer<GoogleMapController>? complertecontroller;
  Myservices myservices = Get.find();
  OrderDetailsData orderDetailsData = OrderDetailsData(Dio());
  StatusRequest statusRequest = StatusRequest.loding;

  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  List<CartModel> data = [];

  double? lat;
  double? long;

  initialData() {
    if (ordersmodel.orderstype == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersmodel.addressLat!),
          double.parse(ordersmodel.addressLong!),
        ),
        zoom: 14.4746,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(
            double.parse(ordersmodel.addressLat!),
            double.parse(ordersmodel.addressLong!),
          ),
        ),
      );
    }
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    complertecontroller = Completer<GoogleMapController>();
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loding;

    var response = await orderDetailsData.getData(
      int.parse(ordersmodel.ordersId!),
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }
}
