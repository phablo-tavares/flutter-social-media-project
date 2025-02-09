import 'package:get/get.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/bindings/login_bindings.dart';
import 'package:rede_social_flutter/src/modules/auth/presentation/login/pages/login_page.dart';

class AuthRoutes {
  static const String login = '/login';
}

class AuthRoutesPages {
  AuthRoutesPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: AuthRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
