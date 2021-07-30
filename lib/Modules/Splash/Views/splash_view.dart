import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Splash/Controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller = Get.find<SplashController>();
    Controller.checkLoggedInStatus();
    return Container(
      width: Get.width,
      height: Get.height,
      color: Color(0xfff6f6f6),
      padding: const EdgeInsets.only(top: 187, bottom: 208, ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            width: 300,
            height: 245,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(92),
            ),
            child: Image(
              image: AssetImage('assets/splash.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}

