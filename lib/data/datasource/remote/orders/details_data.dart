import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class OrderDetailsData {
  Dio dio;
  OrderDetailsData(this.dio);

  getData(int orderId) async {
    var response = await dio.get("${Applink.ordersdetails}?ordersid=$orderId");

    return response.data;
  }
}
