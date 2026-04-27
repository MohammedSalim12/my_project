import 'package:dio/dio.dart';
import 'package:ecommerce_app/linkapi.dart';

class MyfavoriteData {
  Dio dio;
  MyfavoriteData(this.dio);

  getData(int favorite_usersid) async {
    var response = await dio.get(
      "${Applink.favoriteView}?favorite_usersid=$favorite_usersid",
    );
    return response.data;
  }

  deleteData(int favorite_id) async {
    var response = await dio.post(
      "${Applink.deletfrommyfavorite}?favorite_id=$favorite_id",
    );
    return response.data;
  }
}
