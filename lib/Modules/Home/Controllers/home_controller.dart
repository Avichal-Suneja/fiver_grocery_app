import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Models/Cart.dart';
import 'package:grocery_app/Models/Product.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class HomeController extends GetxController{
  RxList<Product> products = <Product>[].obs;
  List<String> categories = [];
  Rx<Cart> cart = new Cart().obs;
  String phoneNumber = '';

  final _db = Get.find<DatabaseService>();
  final _auth = Get.find<AuthService>();

  TextEditingController pincodeController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();



  void applyFilterCategory(String category){
    products.bindStream(_db.getStreamWhere('products', 'category', category).map((list) => list.docs
        .map((doc) => Product.fromJson(doc.data() as Map))
        .toList()));
  }

  void addToCart(Product product){
    cart.value.addToCart(product);
  }

  void removeFromCart(Product product){
    cart.value.removeFromCart(product);
  }

  void placeOrder() async {
    await _db.upsert('orders/${_auth.currentUser!.uid}/address',{
      'pincode' : pincodeController.text,
      'state' : stateController.text,
      'city' : cityController.text,
      'phone' : phoneNumber
    });
    await _db.upsert('orders/${_auth.currentUser!.uid}/cart', cart.value.mappedCart());
    Get.offAllNamed('/home');
    Get.rawSnackbar(message: 'Order Placed Successfully!');
  }

  @override
  void onInit() async {
    products.bindStream(_db.getStream('products').map((list) => list.docs
        .map((doc) => Product.fromJson(doc.data() as Map))
        .toList()));
    categories = await _db.getData('categories')['list'];
    phoneNumber = await _db.getData('users/${_auth.currentUser!.uid}')['Phone'];
    super.onInit();
  }
}