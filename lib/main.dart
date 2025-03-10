// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rede_social_flutter/firebase_options.dart';
import 'package:rede_social_flutter/src/core/bindings/initial_bindings.dart';
import 'package:rede_social_flutter/src/core/routers/app_routes.dart';
import 'package:rede_social_flutter/src/modules/splash/presentation/pages/splash_page.dart';

//TODO proximo passo: testar todo o fluxo do app e corrigir erros
//TODO criar sistema de tradução do app
//TODO Usar camera awesome
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if (!kIsWeb) {
      getPermissions();
    }
    super.initState();
  }

  void getPermissions() async {
    await [
      Permission.microphone,
      Permission.camera,
      Permission.appTrackingTransparency,
      Permission.notification,
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appPages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      initialBinding: InitialBindings(),
      unknownRoute: appPages.last,
    );
  }
}
