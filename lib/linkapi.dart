class Applink {
  // ============== Statics =============================
  static const String server = "http://192.168.10.206:9000";
  static const String imagestatic = "http://192.168.10.206:9000/upload";

  // ========== Auth =========
  static const String signup = "$server/users/signup";
  static const String verycode = "$server/users/verify";
  static const String login = "$server/users/login";
  static const String forgetpassword = "$server/users/forgetpassword";
  static const String verifycoderesetpassword =
      "$server/users/verifycoderesetpassword";
  static const String resetpassword = "$server/users/resetpassword";
  static const String resend = "$server/resend";

  // ========= Home ============
  static const String homepage = "$server/home";

  // ========= items ============
  static const String items = "$server/items";
  static const String search = "$server/items/search";

  // ================= Image =================

  static const String imagecategoris = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";

  // ================= favorite =================
  static const String favoriteAdd = "$server/favorite/add";
  static const String favoriteRemove = "$server/favorite/remove";
  static const String favoriteView = "$server/favorite/view";
  static const String deletfrommyfavorite =
      "$server/favorite/deletefrommyfavorite";

  //================ cart ======================
  static const String cartview = "$server/cart/view";
  static const String crtadd = "$server/cart/add";
  static const String cartdelete = "$server/cart/delete";
  static const String cartgetcount = "$server/cart/getcount";

  //============== Address ======================
  static const String addressView = "$server/address/view";
  static const String addressAdd = "$server/address/add";
  static const String addressEdait = "$server/address/edit";
  static const String addressDelete = "$server/address/delete";

  //===============coupon======================
  static const String checkcoupon = "$server/coupon/check";

  //=============== checkout ==================
  static const String checkout = "$server/order/checkout";
  static const String pendingorders = "$server/order/pending";
  static const String archive = "$server/order/archive";

  //=============== notication ================
  static const String notification = "$server/notification/notificationview";
  //=============== order =====================
  static const String ordersdetails = "$server/order/details";
  static const String ordersdelete = "$server/order/delete";
  static const String ordersarchive = "$server/order/archive";
  //=============== offers ====================
  static const String offers = "$server/offers";
  //=============== rating ====================
  static const String rating = "$server/rating";
}





















//fastapi-ecommerce-api-production.up.railway.app
//https://fastapi-ecommerce-api-production.up.railway.app