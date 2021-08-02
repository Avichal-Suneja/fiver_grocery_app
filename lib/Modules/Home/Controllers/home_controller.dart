import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Models/Cart.dart';
import 'package:grocery_app/Models/Order.dart';
import 'package:grocery_app/Models/Product.dart';
import 'package:grocery_app/Services/AuthService.dart';
import 'package:grocery_app/Services/DatabaseService.dart';

class HomeController extends GetxController{
  RxList<Product> products = <Product>[].obs;
  RxList<Product> searchedProducts = <Product>[].obs;
  List<dynamic> categories = [];
  List<dynamic> categoriesImages = [];
  Rx<Cart> cart = new Cart().obs;
  Rx<Order> order = new Order().obs;
  RxInt navIndex = 0.obs;
  String phoneNumber = '';

  RxList<dynamic> categorySelected = [].obs;
  RxBool address = false.obs;

  final _db = Get.find<DatabaseService>();
  final _auth = Get.find<AuthService>();

  TextEditingController searchController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();

  void showAddress(){
    address.value = true;
  }

  void showCart(){
    address.value = false;
  }

  void applyFilterCategory(String category){
    searchedProducts.bindStream(_db.getStreamWhere('products', 'category', category).map((list) => list.docs
        .map((doc) => Product.fromJson(doc.data() as Map))
        .toList()));
  }

  void removeFilter(){
    searchedProducts.bindStream(_db.getStream('products').map((list) => list.docs
        .map((doc) => Product.fromJson(doc.data() as Map))
        .toList()));
  }

  void addToCart(Product product){
    cart.value.addToCart(product);
  }

  void removeFromCart(Product product){
    cart.value.removeFromCart(product);
  }

  placeOrder() async {
    await _db.upsert('orders/${_auth.currentUser!.uid}',{
      'pincode' : pincodeController.text,
      'state' : stateController.text,
      'city' : cityController.text,
      'phone' : phoneNumber,
      'cart' : cart.value.mappedCart(),
      'isCompleted' : false
    });
    Get.offAllNamed('/home');
    cart.value.clearCart();
    showCart();
    Get.rawSnackbar(message: 'Order Placed Successfully!');
  }

  logOut() async {
    await _auth.logout();
    Get.offAllNamed('/auth');
  }

  Product getProductFromPid(int pid){
    for(var product in products){
      if(product.pid == pid)
        return product;
    }
    return Product(pid: 0, name: '', price: {'default':0}, category: '', image: '');
  }

  @override
  void onInit() async {
    var data;
    products.bindStream(_db.getStream('products').map((list) => list.docs
        .map((doc) => Product.fromJson(doc.data() as Map))
        .toList()));
    searchedProducts.value = products;
    searchController.addListener(() {
      searchedProducts.value = products.where((product) {
        var productName = product.name.toLowerCase();
        return productName.contains(searchController.text.toLowerCase());
      }).toList();
    });
    data = await _db.getData('categories/101');
    categories = data['List'];
    categoriesImages = data['images'];
    for(var category in categories){
      categorySelected.add(false);
    }
    data = await _db.getData('users/${_auth.currentUser!.uid}');
    phoneNumber = data['Phone'];
    try{
      data = await _db.getData('orders/${_auth.currentUser!.uid}');
      order.value.price = data['cart']['totalPrice'];
      order.value.isCompleted = data['isCompleted'];
    }catch(e){
      print('No orders ${e.toString()}');
      order.value.price = 0;
      order.value.isCompleted = false;
    }
    super.onInit();
  }
}