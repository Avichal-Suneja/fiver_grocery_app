import 'package:flutter/material.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:get/get.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed:() async {
            await controller.logOut();
          },
        ),
      ),
    );
  }
}
