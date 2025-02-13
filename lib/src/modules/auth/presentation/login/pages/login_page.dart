import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/core/routers/auth_routes.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailField,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  hintText: 'Digite seu email',
                ),
                validator: (currentEmail) => controller.emailValidator(currentEmail ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordField,
                  obscureText: controller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    label: const Text('Senha'),
                    hintText: 'Digite sua senha',
                    suffixIcon: GestureDetector(
                      child: Icon(
                        controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                      ),
                      onTap: () {
                        controller.togglePasswordVisible();
                      },
                    ),
                  ),
                  validator: (currentPassword) => controller.passwordValidator(currentPassword ?? ''),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Primeiro acesso? '),
                  GestureDetector(
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                    onTap: () {
                      Get.toNamed(AuthRoutes.createAccount);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Login'),
        onPressed: () {
          if (controller.loginFormKey.currentState!.validate()) {
            Get.snackbar('teste', 'deu certo');
          }
        },
      ),
    );
  }
}
