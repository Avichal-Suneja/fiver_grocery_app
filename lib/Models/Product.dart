class Product {
  int pid;
  String name;
  Map<String, dynamic> price;
  String category;
  String image;

  Product(
      {required this.pid,
      required this.name,
      required this.price,
      required this.category,
      required this.image});

  factory Product.fromJson(Map json){
    return Product(
      pid: json['pid'],
      name: json['name'],
      price: Map<String, dynamic>.from(json['price']),
      category: json['category'],
      image: json['image']
    );
  }

}
