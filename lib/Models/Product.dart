class Product {
  int pid;
  String name;
  Map<String, double> price;
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
      price: json['price'],
      category: json['category'],
      image: json['image']
    );
  }
}
