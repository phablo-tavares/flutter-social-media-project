import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/create_account/bindings/create_account_binding.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/create_account/pages/create_account_page.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/forget_password/bindings/forget_password_binding.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/forget_password/pages/forget_password_page.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/bindings/login_bindings.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/pages/login_page.dart';

class AuthRoutes {
  static const String login = '/login';
  static const String createAccount = '/create-account';
  static const String forgetPassword = '/forget-password';
}

class AuthRoutesPages {
  AuthRoutesPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: AuthRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AuthRoutes.createAccount,
      page: () => const CreateAccountPage(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: AuthRoutes.forgetPassword,
      page: () => const ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
  ];
}
