import 'package:get/get.dart';
import 'package:grocery_app/Modules/Splash/Controllers/splash_controller.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(SplashController());
    Get.put(DatabaseService());
  }
}