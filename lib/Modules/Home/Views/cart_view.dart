import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Utils/icons.dart';
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
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
                  Text('Cart', style: TextStyle(
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
                  itemCount: controller.products.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
                      child: Center(
                        child: SizedBox(
                          height: 150,
                          width: Get.width * 0.9,
                          child: Card(
                              color: Colors.grey[300],
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                          controller.products[index].image),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.products[index].name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Rs. ${controller.products[index].price['default'].toString()}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff1bc300),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(28.0,0,0,40.0),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                height: 28,
                                                width: 28,
                                              child: ElevatedButton(onPressed: (){},
                                                child: Icon(Icons.remove),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 2,
                                                    primary: Color(0xff1bc300),
                                                  padding: EdgeInsets.all(2)
                                                ),
                                              ),
                                            ),
                                            Text(' 0 ', style: TextStyle(
                                              fontSize: 28,
                                              decoration: TextDecoration.underline,
                                              )
                                            ),
                                            SizedBox(
                                              height: 28,
                                              width: 28,
                                              child: ElevatedButton(onPressed: (){},
                                                child: Icon(Icons.add),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 2,
                                                    primary: Color(0xff1bc300),
                                                    padding: EdgeInsets.all(2)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,24.0,16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(onPressed: (){},
                  child: Text('Check-Out'),
                  style: ElevatedButton.styleFrom(
                      elevation: 8,
                      primary: Color(0xff1bc300)
                  ),
                ),
              ),
            ),
          ],),),
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
      ),),);
  }
}
