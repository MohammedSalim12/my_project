class myFavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? userId;

  myFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'].toString();
    favoriteUserid = json['favorite_usersid'].toString();
    favoriteItemsid = json['favorite_itemsid'].toString();
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDiscount = json['items_discount'].toString();
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'].toString();
  }
}
