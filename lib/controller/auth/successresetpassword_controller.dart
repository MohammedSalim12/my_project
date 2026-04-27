import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:get/get.dart';

abstract class SuccessresetpasswordController extends GetxController {
  goToLogin();
}

class SuccessresetpasswordControllerImp extends SuccessresetpasswordController {
  @override
  goToLogin() {
    Get.offNamed(AppRoutse.login);
  }
}
