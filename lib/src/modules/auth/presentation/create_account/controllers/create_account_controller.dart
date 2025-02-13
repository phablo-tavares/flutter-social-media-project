import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  TextEditingController nameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  String selectedDDD = '';
  TextEditingController phoneNumberField = TextEditingController();

  GlobalKey<FormState> createAccountFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  final List<String> dddList = [
    '11', '12', '13', '14', '15', '16', '17', '18', '19', // São Paulo e região
    '21', '22', '24', // Rio de Janeiro e região
    '27', '28', // Espírito Santo
    '31', '32', '33', '34', '35', '37', '38', // Minas Gerais
    '41', '42', '43', '44', '45', '46', // Paraná
    '47', '48', '49', // Santa Catarina
    '51', '53', '54', '55', // Rio Grande do Sul
    '61', '62', '64', // Goiás e Distrito Federal
    '63', '65', '66', '67', '68', '69', // Tocantins, Mato Grosso, Mato Grosso do Sul e Acre
    '71', '73', '74', '75', '77', // Bahia
    '79', // Sergipe
    '81', '82', '83', '84', '85', '86', '87', '88',
    '89', // Pernambuco, Alagoas, Paraíba, Rio Grande do Norte, Ceará, Piauí
    '91', '92', '93', '94', '95', '96', '97', '98', '99', // Pará, Amapá, Amazonas, Roraima, Rondônia
  ];

  @override
  void onClose() {
    emailField.dispose();
    passwordField.dispose();
    phoneNumberField.dispose();
  }

  String? nameValidator(String currentName) {
    if (currentName.isEmpty) {
      return "Informe seu nome completo!";
    }
    return null;
  }

  String? emailValidator(String currentEmail) {
    if (!EmailValidator.validate(currentEmail)) {
      return "Informe um email válido!";
    }
    return null;
  }

  String? dddValidator(String currentDDD) {
    if (currentDDD.isEmpty) {
      return "Selecione um DDD!";
    }
    return null;
  }

  String? phoneNumberValidator(String currentPhoneNumber) {
    if (currentPhoneNumber.length != 9) {
      return "O telefone deve ter 9 dígitos!";
    }
    return null;
  }

  String? passwordValidator(String currentPassword) {
    if (currentPassword.length < 8) {
      return "A senha deve ter mais de 8 digitos!";
    }
    return null;
  }

  void togglePasswordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
