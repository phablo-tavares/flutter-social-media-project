import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/forget_password/controllers/forget_passord_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ForgetPassordController(
        authDatasource: Get.find(),
      ),
    );
  }
}
