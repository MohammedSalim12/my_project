import 'package:ecommerce_app/data/modael/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProdactdetilsController extends GetxController {}

class ProdactdetilsControllerImp extends ProdactdetilsController {
  late Itemsmodel itemsmodel;
  List sunitems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "black", "id": "2", "active": "0"},
    {"name": "yallow", "id": "3", "active": "1"},
  ];

  intialData() {
    itemsmodel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
