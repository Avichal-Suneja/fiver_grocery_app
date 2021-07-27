import 'package:get/get.dart';
import 'package:grocery_app/Modules/Settings/Controllers/settings_controller.dart';

class SettingsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}