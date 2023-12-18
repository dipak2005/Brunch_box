import 'dart:core';

class Product {
  String? image;
  String? name;
  String? price;
  int? product;
  num delivery;
  String? rating;
  String? discount;
  String? routename;
  int? index;
  String? recipe;
  bool? gujarati = false;
  bool? rajsathani = false;
  bool? panjabi = false;
  bool? south = false;
  bool? north = false;
  bool? mp = false;
  bool? healthy = false;
  bool? salad = false;
  bool? fruite = false;

  Product(
      {this.image,
      this.name,
      this.price,
      required this.product,
      required this.delivery,
      this.rating,
      this.discount,
      this.routename,
      required this.index,
      required this.mp,
      required this.north,
      required this.panjabi,
      required this.rajsathani,
      required this.south,
      this.healthy,
      this.fruite,
      this.salad,
      this.gujarati,this.recipe});

  factory Product.frommap(Map<String, dynamic> map) {
    return Product(
      image: map["image"],
      name: map["name"],
      price: map["price"],
      product: map["product"],
      delivery: 20,
      rating: map["rating"],
      discount: map["discount"],
      routename: map["routename"],
      index: map["index" ?? 0],
      mp: map["mp"],
      north: map["north"],
      panjabi: map["panjabi"],
      rajsathani: map["rajsathani"],
      south: map["south"],
      fruite: map["fruite"],
      gujarati: map["gujarati"],
      healthy: map["healthy"],
      salad: map["salad"],
      recipe: map["recipe"],
    );
  }
}
