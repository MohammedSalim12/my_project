import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class CartData {
  Dio dio;
  CartData(this.dio); 

  cartAdd(int itemsid, int usersid) async {
    var response = await dio.post(
      "${Applink.crtadd}?itemsid=$itemsid&usersid=$usersid",
    );
    return response.data;
  }
 
  cartDelete(int itemsid, int usersid) async {
    var response = await dio.post(
      "${Applink.cartdelete}?itemsid=$itemsid&usersid=$usersid",
    ); 
    return response.data;
  }
  cartcount(int itemsid, int usersid) async {
    var response = await dio.get(
      "${Applink.cartgetcount}?itemsid=$itemsid&usersid=$usersid",
    );
    return response.data;
  }
  cartview(int usersid) async {
    var response = await dio.get(
      "${Applink.cartview}?usersid=$usersid",
    );
    return response.data;
  }
  
}
