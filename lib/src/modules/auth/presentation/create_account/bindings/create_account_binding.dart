import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/create_account/controllers/create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CreateAccountController(
        authDatasource: Get.find(),
      ),
    );
  }
}
