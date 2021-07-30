import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Splash/Controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    controller.checkLoggedInStatus();
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6)
      ),
      child: Center(
        child: Image.asset('assets/splash.jpeg'),
      ),
    );
  }
}

