import 'package:flutter/material.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Utils/icons.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Center(
        child: Text('Profile View')
      ),
        bottomNavigationBar:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              onTap: (index){
                switch(index){
                  case 0:
                    Get.offAllNamed('/home');
                    break;

                  case 1:
                    Get.offAllNamed('/orders');
                    break;

                  case 2:
                    Get.offAllNamed('/profile');
                    break;

                  case 3:
                    Get.offAllNamed('/cart');
                    break;

                  case 4 :
                    controller.logOut();
                    break;
                }
                controller.navIndex.value = index;
              },
              currentIndex: controller.navIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MyFlutterApp.home, color: Colors.black.withOpacity(0.7), size: 35),
                    label: 'Home',
                    backgroundColor: Color(0xff1bc300),
                    activeIcon: Icon(MyFlutterApp.home, color: Color(0xfffee500), size: 35)
                ),
                BottomNavigationBarItem(
                    icon: Icon(MyFlutterApp.order_list,
                        color: Colors.black.withOpacity(0.7), size: 35),
                    label: 'Order List',
                    backgroundColor: Color(0xff1bc300),
                    activeIcon: Icon(MyFlutterApp.order_list, color: Color(0xfffee500), size: 35)),
                BottomNavigationBarItem(
                    icon: Icon(MyFlutterApp.user, color: Colors.black.withOpacity(0.7), size: 40),
                    label: 'Profile',
                    backgroundColor: Color(0xff1bc300),
                    activeIcon: Icon(MyFlutterApp.user, color: Color(0xfffee500), size: 40)),
                BottomNavigationBarItem(
                    icon: Icon(MyFlutterApp.cart, color: Colors.black.withOpacity(0.7), size: 35),
                    label: '  Cart',
                    backgroundColor: Color(0xff1bc300),
                    activeIcon: Icon(MyFlutterApp.cart, color: Color(0xfffee500), size: 35)),
                BottomNavigationBarItem(
                    icon: Icon(MyFlutterApp.logout__1_,
                        color: Colors.black.withOpacity(0.7), size: 35),
                    label: 'Logout',
                    backgroundColor: Color(0xff1bc300),
                    activeIcon: Icon(MyFlutterApp.logout__1_, color: Color(0xfffee500), size: 35)),
              ],
            ),
          ),
        )
    );
  }
}
