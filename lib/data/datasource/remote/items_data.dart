import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class ItemsData {
  Dio dio;
  ItemsData(this.dio);

  getData(int catId, int userId) async {
    var response = await dio.get("${Applink.items}?id=$catId&userid=$userId");

    return response.data;
  }
}
