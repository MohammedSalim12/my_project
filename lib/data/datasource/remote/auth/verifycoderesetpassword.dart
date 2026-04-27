import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class Verifycoderesetpassword {
  Dio dio;
  Verifycoderesetpassword(this.dio);

  postdata(String email, int code) async {
    var response = await dio.post(
      Applink.verifycoderesetpassword,
      data: {
        "user_email": email,
        "verify_code": code, // جاهز، ما يحتاج parse
      },
    );
    return response;
  }
}
