import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/data/datasource/auth_datasource.dart';
import 'package:rede_social_flutter/src/modules/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        authDatasource: Get.find<AuthDatasource>(),
      ),
    );
  }
}
