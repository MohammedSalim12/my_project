import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class LoginData {
  Dio dio;
  LoginData(this.dio);

  postdata(String email, String password) async {
    var response = await dio.post(
      Applink.login,
      data: {"user_email": email, "user_password": password},
    );
    return response.data;
  }
}
