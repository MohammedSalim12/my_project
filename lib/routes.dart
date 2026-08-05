import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:ecommerce_app/core/middelware/mymiddelware.dart';
import 'package:ecommerce_app/test_packeg.dart';
import 'package:ecommerce_app/view/address/add.dart';
import 'package:ecommerce_app/view/address/adddetails.dart';
import 'package:ecommerce_app/view/address/view.dart';
import 'package:ecommerce_app/view/screen/OnBoarding.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/forgetpassowrd.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/success_signUp.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/veryficode.dart';
import 'package:ecommerce_app/view/screen/auth/veryficodesignup.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/homescreen.dart';
import 'package:ecommerce_app/view/screen/items.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/myfavorite.dart';
import 'package:ecommerce_app/view/screen/orders/archive.dart';
import 'package:ecommerce_app/view/screen/orders/detieles.dart';
import 'package:ecommerce_app/view/screen/orders/panding.dart';
import 'package:ecommerce_app/view/screen/prodactdetils.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ecommerce_app/view/screen/items.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
   GetPage(name: "/", page: () => Language() ,
    middlewares: [ Mymiddelware()] 
    ),
  GetPage(name: AppRoutse.cart, page: () => Cart()), 
  GetPage(name: AppRoutse.login, page: () => Login()),
  GetPage(name: AppRoutse.signup, page: () => Signup()),
  GetPage(name: AppRoutse.forgetPassword, page: () => ForgetPassowrd()),
  GetPage(name: AppRoutse.verfiyCode, page: () => VeryfiCode()),
  GetPage(name: AppRoutse.resetPassowrd, page: () => ResetPassword()),
  GetPage(name: AppRoutse.susseccResetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoutse.successSingUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoutse.veryficodesignup, page: () => VeryfiCodeSignUp()),
  //OnBorading
  GetPage(name: AppRoutse.onboarding, page: () => OnBoarding()),
  //home
  GetPage(name: AppRoutse.home, page: () => Homescreen()),
  GetPage(name: AppRoutse.items, page: () => Items()),
  GetPage(name: AppRoutse.prodactdetiles, page: () => Prodactdetils()),
  GetPage(name: AppRoutse.myfavorite, page: () => MyFavorite()),
  //Address
  GetPage(name: AppRoutse.addressadd, page: () => AdressAdd()),
  GetPage(name: AppRoutse.addressview, page: () => AddressView()),
  GetPage(name: AppRoutse.addressaddetails, page: () => AdressAddDetails()),
  GetPage(name: AppRoutse.checkout, page: () => Checkout()),
  // Orders
  GetPage(name: AppRoutse.orderspending, page: () => OrdersPending()),
  GetPage(name: AppRoutse.ordersdetieles, page: () => OrdersDetieles()),
  GetPage(name: AppRoutse.ordersarchive, page: () => OrdersArchive()),
  
]; 

