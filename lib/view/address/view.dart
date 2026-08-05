import 'package:ecommerce_app/controller/address/adressview_controller.dart';
import 'package:ecommerce_app/core/class/handingdataview.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdressviewController controller = Get.put(AdressviewController());
    return Scaffold(
      appBar: AppBar(title: const Text('address')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutse.addressadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AdressviewController>(
        builder: (controller) => Handingdatacontroller(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onDelete: () {
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
            "${addressModel.addressCity!} ${addressModel.addressStreet!}",
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ),
      ),
    );
  }
}
