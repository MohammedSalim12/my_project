import 'package:ecommerce_app/controller/orders/tracking_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Traking extends StatelessWidget {
  const Traking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrakingController());
    return Scaffold(
      appBar: AppBar(title: const Text('Order Traking')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<TrakingController>(
          builder: (controller) => Handingdatacontroller(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    child: GoogleMap(
                      polylines: controller.polylineSet,
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.gmc = controllermap;
                      },
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
