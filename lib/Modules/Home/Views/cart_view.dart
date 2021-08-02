import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Modules/Home/Controllers/home_controller.dart';
import 'package:grocery_app/Utils/icons.dart';
class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
      body: controller.cart.value.cartItems.length==0? Center(child: Text('Your Cart is Empty', style: TextStyle(fontSize: 24))):
      controller.address.value? showAddressScreen(controller):
      SafeArea(
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
                  itemCount: controller.cart.value.cartItems.length,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                          controller.getProductFromPid(controller.cart.value.cartItems[index]['pid']).image),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.getProductFromPid(controller.cart.value.cartItems[index]['pid']).name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Rs. ${controller.getProductFromPid(controller.cart.value.cartItems[index]['pid']).cityPrice.toString()}',
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
                                              child: ElevatedButton(onPressed: (){
                                                controller.cart.value.removeFromCart(controller.getProductFromPid(controller.cart.value.cartItems[index]['pid']));
                                                setState(() {});
                                              },
                                                child: Icon(Icons.remove),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 2,
                                                    primary: Color(0xff1bc300),
                                                  padding: EdgeInsets.all(2)
                                                ),
                                              ),
                                            ),
                                            Text(' ${controller.cart.value.cartItems[index]['qty'].toString()} ',
                                                style: TextStyle(
                                              fontSize: 28,
                                              )
                                            ),
                                            SizedBox(
                                              height: 28,
                                              width: 28,
                                              child: ElevatedButton(onPressed: (){
                                                controller.cart.value.addToCart(controller.getProductFromPid(controller.cart.value.cartItems[index]['pid']));
                                                setState(() {});
                                              },
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
                alignment: Alignment.bottomCenter,
                child: Text('Total Price: ${controller.cart.value.totalPrice.toString()}',
                style: TextStyle(
                  fontSize: 24
                ))
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,24.0,16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(onPressed: (){
                  controller.showAddress();
                },
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
      ),),);
  }
}

Widget showAddressScreen(HomeController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text(
                'Enter your Address',
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xff039f00),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSans',
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
            child: Text(
              'State',
              style: TextStyle(
                color: Color(0xff039f00),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'PTSans',
              ),
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xffe5e5e5),
                width: Get.width * 0.9,
                child: TextFormField(
                  validator: (text) => text!.length<3? 'State should be at least 3 characters' : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green, width: 3.0)),
                  ),
                  controller: controller.stateController,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
            child: Text(
              'City',
              style: TextStyle(
                color: Color(0xff039f00),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'PTSans',
              ),
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xffe5e5e5),
                width: Get.width * 0.9,
                child: TextFormField(
                  validator: (text) => text!.length<3? 'City should atleast be 3 characters' : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green, width: 3.0)),
                  ),
                  controller: controller.cityController,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
            child: Text(
              'Pin code',
              style: TextStyle(
                color: Color(0xff039f00),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'PTSans',
              ),
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xffe5e5e5),
                width: Get.width * 0.9,
                child: TextFormField(
                  validator: (text) => text!.length<6? 'Pin code cannot be smaller than 6 characters' : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green, width: 3.0)),
                  ),
                  controller: controller.pincodeController,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
            child: Text(
              'Street',
              style: TextStyle(
                color: Color(0xff039f00),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'PTSans',
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xffe5e5e5),
                width: Get.width * 0.9,
                child: TextFormField(
                  validator: (text) => text!.isEmpty? 'Street cannot be Empty' : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green, width: 3.0)),
                  ),
                  controller: controller.streetController,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 46,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      await controller.placeOrder();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffe5e5e5),
                      shadowColor: Colors.black12,
                      elevation: 5),
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff039f00),
                      fontFamily: 'PTSans',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
  );
}
