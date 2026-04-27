import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';


class SignupData {
  Dio dio;
  SignupData(this.dio);

  postdata(String username, String email, String password, String phone) async {
    var response = await dio.post(
      Applink.signup,
      data: {
        "user_name": username,
        "user_email": email,
        "user_password": password,
        "user_phone": phone, 
      },
    );
    return response;
  }
}

