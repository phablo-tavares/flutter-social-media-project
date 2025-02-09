import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rede_social_flutter/src/modules/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE APP BAR!!'),
      ),
      body: const Center(
        child: Text('HOME PAGE!!!'),
      ),
    );
  }
}
