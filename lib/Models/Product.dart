class Product {
  int pid;
  String name;
  int quantity;
  Map<String, double> price;
  String category;

  Product(
      {required this.pid,
      required this.name,
      required this.quantity,
      required this.price,
      required this.category});
  
}
