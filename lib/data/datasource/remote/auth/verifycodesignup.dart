import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class VerifycodesignupData {
  Dio dio;
  VerifycodesignupData(this.dio);

  postdata(String email, String code) async {
    var response = await dio.post(
      Applink.verycode,
      data: {"verify_code": int.parse(code), "user_email": email},
    );
    return response;
  }

  resendData(String email) async {
    var response = await dio.post(
      Applink.resend,
      data: {"user_email": email},
    );
    return response;
  }
}
