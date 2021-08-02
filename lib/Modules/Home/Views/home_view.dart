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
                      controller: controller.searchController,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14.0,0,0,0),
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: GestureDetector(
                          onTap: (){
                            if(controller.categorySelected[index]==false){
                              controller.applyFilterCategory(controller.categories[index]);
                              controller.categorySelected[index] = true;
                              for(int i=0; i<controller.categorySelected.length; i++){
                                if(i!=index){
                                  controller.categorySelected[i] = false;
                                }
                              }
                            }else{
                              controller.removeFilter();
                              controller.categorySelected[index] = false;
                            }
                          },
                          child: Card(
                            color: controller.categorySelected[index]? Colors.yellowAccent:Colors.grey[300],
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(controller.categoriesImages[index]),

                                ),
                                SizedBox(width: 6),
                                Text(controller.categories[index])
                              ],
                            ),
                          )),
                        ),
                      );
                    },
                  ),
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
                    itemCount: controller.searchedProducts.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
                        child: Center(
                          child: SizedBox(
                            height: 150,
                            width: Get.width*0.9,
                            child: Card(
                                color: Colors.grey[300],
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(
                                        controller.searchedProducts[index].image),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.searchedProducts[index].name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        'Rs. ${controller.searchedProducts[index].price['default'].toString()}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff1bc300),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton.icon(onPressed: (){
                                        controller.cart.value.addToCart(controller.searchedProducts[index]);
                                      },
                                          icon: Icon(MyFlutterApp.cart),
                                          label: Text('Add to Cart'),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 8,
                                        primary: Color(0xff1bc300)
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
            ],
          ),
        ),
        extendBody: true,
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
        )));
  }
}
