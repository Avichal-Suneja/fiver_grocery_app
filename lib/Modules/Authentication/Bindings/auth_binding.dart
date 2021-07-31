import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Controllers/auth_controller.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(DatabaseService());
    Get.put(AuthController());
  }
}