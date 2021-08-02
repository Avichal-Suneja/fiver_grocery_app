import 'package:grocery_app/Models/Product.dart';

class Cart{
  List<Map<String, dynamic>> cartItems = [];
  dynamic totalPrice = 0;
  Cart();

  void addToCart(Product product){
    bool isPresent = false;
    for(var item in cartItems){
      if(item['pid'] == product.pid){
        item['qty']+=1;
        totalPrice+=product.cityPrice;
        isPresent = true;
        print('This happened');
      }
    }

    if(!isPresent){
      cartItems.add({
        'pid' : product.pid,
        'qty' : 1
      });
      totalPrice+=product.cityPrice;
    }
    print(cartItems);
  }

  void removeFromCart(Product product){
    for(var item in cartItems){
      if(item['pid'] == product.pid){
        item['qty']-=1;
        totalPrice-=product.cityPrice;
      }
    }
    cartItems.removeWhere((item) => item['qty'] == 0);
    print(cartItems);
  }

  void clearCart(){
    cartItems = [];
    totalPrice = 0;
  }

  Map<String, dynamic> mappedCart(){
    Map<String, dynamic> map = {};
    for(var item in cartItems){
      map[item['pid'].toString()] = item;
    }
    map['totalPrice'] = totalPrice;
    return map;
  }

  factory Cart.fromJson(json){
    Cart cart = new Cart();
    return cart;
  }
  
}