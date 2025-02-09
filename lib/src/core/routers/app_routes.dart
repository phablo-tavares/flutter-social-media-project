import 'package:get/get.dart';
import 'package:rede_social_flutter/src/core/routers/auth_routes.dart';
import 'package:rede_social_flutter/src/modules/home/presentation/bindings/home_binding.dart';
import 'package:rede_social_flutter/src/modules/home/presentation/pages/home_page.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/pages/splash_page.dart';

const String homePage = '/home-page';
const String splashPage = '/splash-page';

List<GetPage> appPages = [
  ...AuthRoutesPages.routes,
  GetPage(
    name: homePage,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),

  //SEMPRE MANTER A SPLASH POR ULTIMO!!!
  GetPage(
    name: splashPage,
    page: () => const SplashPage(),
    binding: SplashBinding(),
  ),
];
