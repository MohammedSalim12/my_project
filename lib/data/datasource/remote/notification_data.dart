import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class NotificationData {
  Dio dio;
  NotificationData(this.dio);

  getData( int userId) async {
    var response = await dio.get("${Applink.notification}?notification_usersid=$userId");

    return response.data;
  }
}
