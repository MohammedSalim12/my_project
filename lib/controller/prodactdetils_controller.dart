import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/statusRequest.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProdactdetilsController extends GetxController {}

class ProdactdetilsControllerImp extends ProdactdetilsController {
  StatusRequest statusRequest = StatusRequest.none;
  CartControllerImp cartcontroller = Get.find<CartControllerImp>();
  late Itemsmodel itemsmodel;
  List sunitems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "black", "id": "2", "active": "0"},
    {"name": "yallow", "id": "3", "active": "1"},
  ];
  int countcart = 0;
  intialData() async {
    statusRequest = StatusRequest.loding;
    itemsmodel = Get.arguments['itemsmodel'];
    countcart = await cartcontroller.cartcount(
      int.tryParse(itemsmodel.itemsId ?? "0") ?? 0,
    );
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    
    countcart++;
    update();
  }

  remove() {
    if (countcart > 0) {
      countcart--;  
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
