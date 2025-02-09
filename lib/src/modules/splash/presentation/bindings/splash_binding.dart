import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
