import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/core/routers/auth_routes.dart';
import 'package:rede_social_flutter/src/modules/auth/data/datasource/auth_datasource.dart';

//TODO contador de 5 min para mandar de novo o email de resetar a senha
class ForgetPassordController extends GetxController {
  ForgetPassordController({required this.authDatasource});
  AuthDatasource authDatasource;

  TextEditingController emailField = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  String? emailValidator(String currentEmail) {
    if (!EmailValidator.validate(currentEmail)) {
      return "Informe um email válido";
    }
    return null;
  }

  Future<void> handleForgetPassword() async {
    try {
      await authDatasource.sendPasswordResetEmail(
        email: emailField.text,
      );
      Get.toNamed(AuthRoutes.login);
      Get.snackbar('Email enviado', 'Verifique sua caixa de email para resetar a senha!');
    } catch (e) {
      Get.snackbar('Erro', 'Ocorreu um problema tente novamente mais tarde');
    }
  }
}
