import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/bindings/splash_binding.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies();
  }
}
