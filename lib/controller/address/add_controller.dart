import 'dart:async';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? complertecontroller;
  StatusRequest statusRequest = StatusRequest.loding;

  Position? position;
  CameraPosition? KGooglePlex;
  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarker(LatLng latlong) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlong));
    lat = latlong.latitude;
    long = latlong.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(
      AppRoutse.addressaddetails,
      arguments: {"lat": lat.toString(), "long": long.toString()},
    );
  }

  // ✅ الحل
  getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // نضع موقع افتراضي إذا رفض الـ permission
        KGooglePlex = CameraPosition(
          target: LatLng(33.5138, 36.2765),
          zoom: 14.4746,
        );
        statusRequest = StatusRequest.none;
        update();
        return;
      }

      position = await Geolocator.getCurrentPosition();
      KGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
      statusRequest = StatusRequest.none;
      update();
    } catch (e) {
      print('Error: $e');
      statusRequest = StatusRequest.none;
      update();
    }
  }

  static const CameraPosition _KLake = CameraPosition(
    bearing: 192.8334,
    target: LatLng(37.4326468467, -122.08856346565),
    tilt: 59.4404573356,
    zoom: 19.153246346,
  );

  @override
  void onInit() {
    getCurrentLocation();
    complertecontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
