import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onClose() {
    emailField.dispose();
    passwordField.dispose();
  }

  String? emailValidator(String currentEmail) {
    if (!EmailValidator.validate(currentEmail)) {
      return "Informe um email válido";
    }
    return null;
  }

  String? passwordValidator(String currentPassword) {
    if (!(currentPassword.length >= 8)) {
      return "A senha deve ter mais de 8 digitos";
    }
    return null;
  }

  void togglePasswordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
