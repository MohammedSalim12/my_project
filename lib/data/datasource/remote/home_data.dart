import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class HomeData {
  Dio dio;
  HomeData(this.dio);

  getData() async { 
    var response = await dio.get(Applink.homepage);  
    return response.data; 
  }
  searchData(String search) async {   
    var response = await dio.get("${Applink.search}?search=$search");  
    return response.data; 
  }
}
