import 'package:get/get.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(DatabaseService());
    Get.put(HomeController(), permanent: true);
  }
}