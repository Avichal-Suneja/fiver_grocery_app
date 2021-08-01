import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Authentication/Bindings/auth_binding.dart';
import 'package:grocery_app/Modules/Home/Bindings/home_binding.dart';
import 'package:grocery_app/Modules/Home/Views/home_view.dart';
import 'package:grocery_app/Modules/Settings/Bindings/settings_binding.dart';
import 'package:grocery_app/Modules/Settings/Views/settings_view.dart';
import 'package:grocery_app/Modules/Splash/Bindings/splash_binding.dart';
import 'package:grocery_app/Modules/Splash/Views/splash_view.dart';
import 'package:grocery_app/Utils/appTheme.dart';
import 'Modules/Authentication/Views/auth_view.dart';
import 'Modules/Home/Views/cart_view.dart';
import 'Modules/Home/Views/orders_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery App',
      getPages: [
        GetPage(name: '/splash', page: ()=> SplashView(), binding: SplashBindings()),
        GetPage(name: '/auth', page: ()=> AuthView(), binding: AuthBinding()),
        GetPage(name: '/home', page: ()=> HomeView(), binding: HomeBindings(),),
        GetPage(name: '/cart', page: ()=> CartView()),
        GetPage(name: '/orders', page: ()=> OrdersView()),
        GetPage(name: '/settings', page: ()=> SettingsView(), binding: SettingsBindings()),
      ],
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    );
  }
}
