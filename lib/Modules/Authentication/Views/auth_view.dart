import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Controllers/auth_controller.dart';
class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return controller.signIn.value? showSignIn() : showSignUp();
  }
}

Widget showSignIn(){
  return Scaffold();
}

Widget showSignUp(){
  return Scaffold();
}
