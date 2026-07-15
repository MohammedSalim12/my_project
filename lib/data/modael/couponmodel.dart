class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpiredate;
  

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'].toString();
    couponName = json['coupon_name'].toString();
    couponCount = json['coupon_count'].toString();
    couponDiscount = json['coupon_discount'].toString();
    couponExpiredate = json['coupon_expiredate'].toString();
    
  }
}
