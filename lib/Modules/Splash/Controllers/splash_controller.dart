import 'package:get/get.dart';
import 'package:grocery_app/Services/AuthService.dart';

class SplashController extends GetxController{
  final _auth = Get.find<AuthService>();

  checkLoggedInStatus() async {
    await Future.delayed(Duration(seconds: 2), (){
      _auth.currentUser!=null? Get.offAllNamed('/home') : Get.offAllNamed('/auth');
    });

    @override
    void onReady() async {
      await checkLoggedInStatus();
      super.onReady();
    }
  }
}