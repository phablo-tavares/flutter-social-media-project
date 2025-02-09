import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
