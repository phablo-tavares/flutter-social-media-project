import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/forget_password/controllers/forget_passord_controller.dart';

class ForgetPasswordPage extends GetView<ForgetPassordController> {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Form(
          key: controller.loginFormKey,
          child: TextFormField(
            controller: controller.emailField,
            decoration: const InputDecoration(
              label: Text('Email'),
              hintText: 'Digite seu email',
            ),
            validator: (currentEmail) => controller.emailValidator(currentEmail ?? ''),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Enviar email de verificação'),
        onPressed: () {
          if (controller.loginFormKey.currentState!.validate()) {
            controller.handleForgetPassword();
          }
        },
      ),
    );
  }
}
