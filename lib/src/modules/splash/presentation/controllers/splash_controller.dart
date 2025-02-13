import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/core/routers/app_routes.dart';
import 'package:rede_social_flutter/src/core/routers/auth_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    redirectAccordingToCurrentUserAuthState();
    super.onInit();
  }

  void redirectAccordingToCurrentUserAuthState() {
    //Validar depois se este listener deve ficar aqui ou ser importado de outro lugar
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        Get.toNamed(AuthRoutes.login);
      } else {
        log('User is signed in!');
        Get.toNamed(homePage);
      }
    });
  }
}
