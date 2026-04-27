import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class Forgetpassworddata {
  Dio dio;
  Forgetpassworddata(this.dio);

  postdata(String email) async {
    var response = await dio.post(
      Applink.forgetpassword,
      data: {
        "user_email": email,
      },
    );
    return response;
  }
}
