import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class FavoriteData {
  Dio dio;
  FavoriteData(this.dio);

  favoriteAdd(int itemsid, int usersid) async {
    var response = await dio.post(
      "${Applink.favoriteAdd}?itemsid=$itemsid&usersid=$usersid",
    );
    return response.data;
  }

  favoriteRemove(int itemsid, int usersid) async {
    var response = await dio.post(
      "${Applink.favoriteRemove}?itemsid=$itemsid&usersid=$usersid",
    );
    return response.data;
  }
}
