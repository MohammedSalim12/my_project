import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class ArchiveData {
  Dio dio;
  ArchiveData(this.dio);

  getData(int userId) async {
    var response = await dio.get("${Applink.ordersarchive}?userid=$userId");

    return response.data;
  }
  ratingData(int orderId , String rating , String comment) async {
    var response = await dio.post("${Applink.rating}?id=$orderId&rating=$rating&comment=$comment");

    return response.data;
  }
}
