import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/data/datasource/auth_datasource.dart';

class HomeController extends GetxController {
  HomeController({
    required this.authDatasource,
  });
  AuthDatasource authDatasource;

  Future<void> logout() async {
    await authDatasource.signOut();
  }
}
