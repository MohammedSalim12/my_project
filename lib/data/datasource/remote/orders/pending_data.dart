import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class PendingData {
  Dio dio;
  PendingData(this.dio);

  getData( int userId) async {
    var response = await dio.get("${Applink.pendingorders}?userid=$userId");

    return response.data;
  }
}
