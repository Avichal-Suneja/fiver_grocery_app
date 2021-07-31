import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class AuthController extends GetxController{
  final _auth = Get.find<AuthService>();
  final _db = Get.find<DatabaseService>();
  RxBool signUpBool = true.obs;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  signIn() async {
    var confirmation = await _auth.signInWithEmail(emailController.text, passwordController.text);
    if(confirmation!='login not Successful'){
      Get.offAllNamed('/home');
    }else{
      Get.rawSnackbar(message: 'Email or Password is incorrect');
      emailController.clear();
      passwordController.clear();
    }
  }

  signUp() async {
    String uid = await _auth.signUpWithEmail(emailController.text, passwordController.text);
    if(uid!='login not Successful'){
      await _db.upsert('users/$uid', {
        'Name' : nameController.text,
        'Phone' : phoneController.text,
        'Email' : emailController.text
      });
      Get.offAllNamed('/home');
    }else{
      Get.rawSnackbar(message: 'Email or Password is incorrect');
      emailController.clear();
      passwordController.clear();
    }
  }

  void showSignUp(){
    signUpBool.toggle();
  }
}