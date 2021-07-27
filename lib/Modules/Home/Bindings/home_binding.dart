import 'package:get/get.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}