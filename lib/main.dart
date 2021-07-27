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

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasData){
          print(snapshot.error);
        }

        if(snapshot.connectionState == ConnectionState.done){
          return GetMaterialApp(
            title: 'Grocery App',
            getPages: [
              GetPage(name: '/splash', page: ()=> SplashView(), binding: SplashBindings()),
              GetPage(name: '/auth', page: ()=> AuthView(), binding: AuthBinding()),
              GetPage(name: '/home', page: ()=> HomeView(), binding: HomeBindings()),
              GetPage(name: '/cart', page: ()=> HomeView()),
              GetPage(name: '/orders', page: ()=> HomeView()),
              GetPage(name: '/settings', page: ()=> SettingsView(), binding: SettingsBindings()),
            ],
            initialRoute: '/splash',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
