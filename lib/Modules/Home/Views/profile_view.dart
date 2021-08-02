import 'package:flutter/cupertino.dart';
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
                    Text('Profile', style: TextStyle(
                        fontSize: 32,
                        color: Color(0xff1bc300),
                        letterSpacing: 1.5
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.4,
                width: Get.width*0.9,
                child: Card(
                  color: Color(0xffe5e5e5),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24.0,24.0,0,0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 24,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Name: ${controller.name}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff1bc300)
                            ),
                          ),
                        ),
                        SizedBox(height: 24,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Phone Number: ${controller.phoneNumber}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff1bc300)
                            ),
                          ),
                        ),
                        SizedBox(height: 24,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email: ${controller.email}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff1bc300)
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,24.0,0,0),
                            child: ElevatedButton.icon(
                              onPressed: (){controller.logOut();},
                              icon: Icon(MyFlutterApp.logout__1_),
                              label: Text('Logout'),
                              style: ElevatedButton.styleFrom(
                                elevation: 4,
                                primary: Color(0xff1bc300),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
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
