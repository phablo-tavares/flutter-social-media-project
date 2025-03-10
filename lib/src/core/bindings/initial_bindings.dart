import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/data/datasource/auth_datasource.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies();

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Get.put(firebaseAuth);

    FirebaseFirestore db = FirebaseFirestore.instance;
    Get.put(db);

    Get.put(
      AuthDatasource(
        firebaseAuth: Get.find(),
        db: Get.find(),
      ),
    );
  }
}
