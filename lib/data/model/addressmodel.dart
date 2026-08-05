class AddressModel {
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'].toString();
    addressUserId = json['address_usersid'].toString();
    addressName = json['address_name'].toString();
    addressCity = json['address_city'].toString();
    addressStreet = json['address_street'].toString();
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
  }
}
