import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_flutter/src/core/routers/auth_routes.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/create_account/controllers/create_account_controller.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Form(
          key: controller.createAccountFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameField,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                  hintText: 'Digite seu nome completo',
                ),
                validator: (currentName) => controller.nameValidator(currentName ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.phoneNumberField,
                decoration: InputDecoration(
                  label: const Text('Telefone'),
                  hintText: 'Digite seu telefonle',
                  prefixIcon: SizedBox(
                    width: 60,
                    child: DropdownButtonFormField<String>(
                      hint: const Text('DDD'),
                      items: controller.dddList.map(
                        (String ddd) {
                          return DropdownMenuItem<String>(
                            value: ddd,
                            child: Text(ddd),
                          );
                        },
                      ).toList(),
                      validator: (selectedDDD) => controller.dddValidator(selectedDDD ?? ''),
                      onChanged: (selectedDDD) {
                        controller.selectedDDD = selectedDDD ?? '';
                      },
                    ),
                  ),
                ),
                validator: (currentPhoneNumber) => controller.phoneNumberValidator(currentPhoneNumber ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Criar conta'),
        onPressed: () {
          if (controller.createAccountFormKey.currentState!.validate()) {
            Get.snackbar('Sucesso', 'Conta criada com sucesso!!');
            Get.offAllNamed(AuthRoutes.login);
          }
        },
      ),
    );
  }
}
