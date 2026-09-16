import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/core/function/polyline.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrakingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  late CameraPosition? cameraPosition;
  Set<Polyline> polylineSet = {};
  Myservices myserveies = Get.find();

  late Ordersmodel ordersmodel;
  List<Marker> markers = [];

  double? dislat;
  double? dislong;

  double? currentlat;
  double? currentlong;

  StatusRequest statusRequest = StatusRequest.success;

  initalData() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersmodel.addressLat!),
        double.parse(ordersmodel.addressLong!),
      ),
      zoom: 14.4746,
    );
    markers.add(
      Marker(
        markerId: MarkerId("current"),
        position: LatLng(
          double.parse(ordersmodel.addressLat!),
          double.parse(ordersmodel.addressLong!),
        ),
      ),
    );
  }

  updataMarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(
      Marker(markerId: MarkerId("current"), position: LatLng(newlat, newlong)),
    );
    update();
  }

  getLocationdelivery() {
    // FirebaseFirestroe.instance
    //     .collection("delivery")
    //     .doc(ordersmodel.ordersId)
    //     .snapshots()
    //     .listen((event) {
    //       if (event.exists) {
    //         dislat = event.get("lat");
    //         dislong = event.get("long");
    //         updataMarkerDelivery(dislat!, dislong!);
    //       }
    //     });
  }

  initpolyline() async {
    dislat = double.parse(ordersmodel.addressLat!);
    dislong = double.parse(ordersmodel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineSet = await getPolyline(currentlat, currentlong, dislat, dislong);
    update();
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordermodel'];
    initalData();
    initpolyline();
    getLocationdelivery();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}
