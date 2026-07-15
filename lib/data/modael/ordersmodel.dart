class Ordersmodel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? orderstype;
  String? orderspricedelivery;
  String? ordersPrice;
  String? ordersTolotalprice;
  String? ordersCoupon;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatatime;
  

  Ordersmodel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUserid = json['orders_userid'].toString();
    ordersAddress = json['orders_address'].toString();
    orderstype = json['orders_type'].toString();
    orderspricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTolotalprice = json['orders_totalprice'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersPaymentmethod = json['orders_paymentmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersDatatime = json['	orders_datetime'].toString();
    
  }
}