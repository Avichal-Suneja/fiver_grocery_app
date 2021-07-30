import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class AuthController extends GetxController{
  final _auth = Get.put(AuthService());
  final _db = Get.put(DatabaseService());
  RxBool signUpBool = false.obs;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void signIn() async {
    await _auth.signInWithEmail(emailController.text, passwordController.text).whenComplete((){
      Get.offAllNamed('/home');
    });
  }

  void signUp() async {
    await _auth.signUpWithEmail(emailController.text, passwordController.text).whenComplete(() async {
      await _db.upsert('users/${_auth.currentUser!.uid}', {
        'Name' : nameController.text,
        'Phone' : phoneController.text,
        'Email' : emailController.text
      });
      Get.offAllNamed('/home');
    });
  }

  void showSignUp(){
    signUpBool.toggle();
  }
}