import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class ResetPasswordData {
  Dio dio;
  ResetPasswordData(this.dio);

  postdata(String email, String password) async {
    var response = await dio.post(
      Applink.resetpassword,
      data: {
        "user_email": email,
        "new_password": password,
      },
    );
    return response;
  }
}
