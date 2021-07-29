import 'package:grocery_app/Models/Product.dart';

class Cart{
  List<Map<String, dynamic>> cartItems = [];
  Cart();

  void addToCart(Product product){
    bool isPresent = false;
    cartItems.map((item){
      if(item['pid'] == product.pid){
        item['qty']+=1;
        isPresent = true;
      }
    });

    if(!isPresent){
      cartItems.add({
        'pid' : product.pid,
        'qty' : 1
      });
    }
  }

  void removeFromCart(Product product){
    cartItems.map((item){
      if(item['pid'] == product.pid){
        item['qty']-=1;
        if(item['qty'] == 0)
          cartItems.remove(item);
      }
    });
  }

  Map<String, dynamic> mappedCart(){
    Map<String, dynamic> map = {};
    cartItems.map((item) => map[item['pid']] = item);
    return map;
  }
  
}