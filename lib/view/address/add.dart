import 'package:ecommerce_app/controller/address/add_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdressAdd extends StatelessWidget {
  const AdressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text('add new address')),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerpage) => Handingdatacontroller(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: controllerpage.KGooglePlex == null
                      ? Center(child: CircularProgressIndicator())
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: controllerpage.markers.toSet(),
                              onTap: (latlong) {
                                controllerpage.addMarker(latlong);
                              },
                              initialCameraPosition:
                                  controllerpage.KGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                    controllerpage.complertecontroller!
                                        .complete(controllermap);
                                  },
                            ),
                            Positioned(
                              bottom: 10,
                              child: Container(
                                child: CustomButtomAuth(
                                  text: " اكمال",
                                  onPressed: () {
                                    controllerpage.goToPageAddDetailsAddress();
                                  },
                                ),
                              ),
                            ),
                          ],
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
