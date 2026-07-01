import 'package:ecommerce_app/bindeing/initialBinding.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/localization/changelocal_controller.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await initialServices();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localecontroller controller = Get.put(Localecontroller()); 
    Get.put(CartControllerImp()); 
    return GetMaterialApp(
      translations: Mytranslation(), 
      debugShowCheckedModeBanner: false,  
      title: 'Flutter Demo', 
      locale: controller.language,
      theme: controller.apptheme, 
      initialBinding: Initialbinding(),  
      getPages: routes,  
    ); 
  }
}
