import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class OffersData {
  Dio dio;
  OffersData(this.dio);

  getData() async { 
    var response = await dio.get(Applink.offers);  
    return response.data; 
  }
  
}
