import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Utils/icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                    child: Icon(
                      MyFlutterApp.location,
                      size: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      'New Delhi, India',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                    child: Text(
                      'Find Fresh ',
                      style: TextStyle(
                        color: Color(0xff1bc300),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Groceries',
                    style: TextStyle(
                      color: Color(0xfffee500),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color(0xffe5e5e5),
                    width: Get.width * 0.9,
                    height: Get.height * 0.07,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xff1bc300),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'SEARCH GROCERIES...',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.22),
                            letterSpacing: 1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3.0)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 100,
                width: Get.width,
                child: ListView.builder(
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(MyFlutterApp.broccoli),
                            SizedBox(width: 6),
                            Text(controller.categories[index])
                          ],
                        ),
                      )),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 16),
                child: Text(
                  'Fresh Groceries',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SizedBox(
                          height: 150,
                          width: Get.width * 0.9,
                          child: Card(
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
                                SizedBox(width: 6),
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
                                )
                              ],
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
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
        )));
  }
}
