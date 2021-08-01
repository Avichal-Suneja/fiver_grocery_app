import 'package:flutter/material.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Utils/icons.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Text('Orders'),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          switch(index){
            case 0:
              Get.offAllNamed('/home');
              break;

            case 1:
              Get.offAllNamed('/orders');
              break;

            case 2:
              Get.offAllNamed('/settings');
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
              icon: Icon(MyFlutterApp.home, color: Colors.black, size: 40),
              label: '',
              backgroundColor: Color(0xff1bc300),
              activeIcon: Icon(MyFlutterApp.home, color: Color(0xfffee500), size: 40)
          ),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.order_list,
                  color: Colors.black, size: 40),
              label: '',
              backgroundColor: Color(0xff1bc300),
              activeIcon: Icon(MyFlutterApp.order_list, color: Color(0xfffee500), size: 40)),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.user, color: Colors.black, size: 40),
              label: '',
              backgroundColor: Color(0xff1bc300),
              activeIcon: Icon(MyFlutterApp.user, color: Color(0xfffee500), size: 40)),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.cart, color: Colors.black, size: 40),
              label: '',
              backgroundColor: Color(0xff1bc300),
              activeIcon: Icon(MyFlutterApp.cart, color: Color(0xfffee500), size: 40)),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.logout__1_,
                  color: Colors.black, size: 40),
              label: '',
              backgroundColor: Color(0xff1bc300),
              activeIcon: Icon(MyFlutterApp.logout__1_, color: Color(0xfffee500), size: 40)),
        ],
      ),
    );
  }
}
