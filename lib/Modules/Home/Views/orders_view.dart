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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0,16.0,0,24.0),
              child: Row(
                children: [
                  Text('My ', style: TextStyle(
                      fontSize: 32,
                      color: Color(0xfffee500),
                      letterSpacing: 1.5
                  ),),
                  Text('Orders', style: TextStyle(
                      fontSize: 32,
                      color: Color(0xff1bc300),
                      letterSpacing: 1.5
                  ),)
                ],
              ),
            ),
            Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
                              child: Center(
                                  child: SizedBox(
                                    height: 150,
                                    width: Get.width * 0.9,
                                    child: Card(
                                    color: Color(0xff1bc300),
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                        ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Order Id: 101',
                                              style: TextStyle(fontSize: 20, ),
                                            ),
                                            Text(
                                              'Price: Rs. ${controller.products[index].price['default'].toString()}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xfffee500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                        );
                    },
                  ),

                ) )
          ],
        ),
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
