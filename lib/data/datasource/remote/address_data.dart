import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class AddressData {
  Dio dio;
  AddressData(this.dio);

  getData(String usersid) async {
    var response = await dio.get("${Applink.addressView}?usersid=$usersid&");
    return response.data;
  }

  AddData(
    String usersid,
    String addressname,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await dio.post(
      "${Applink.addressAdd}?usersid=$usersid&addressname=$addressname&city=$city&street=$street&lat=$lat&long=$long&",
    );
    return response.data;
  }

  DeleteData(String addressid) async {
    var response = await dio.post("${Applink.addressDelete}?addressid=$addressid");
    return response.data;
  }
}
