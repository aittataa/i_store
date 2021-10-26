import 'dart:convert';

import 'specs.dart';

List<Product> productFromJson(String str) {
  return List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
}

class Product {
  final int id;
  final String? manufacturer;
  final String model;
  final String image;
  final double price;
  final String? description;
  final int? stock;
  final Specs? specs;
  late bool status;

  Product({
    required this.id,
    this.manufacturer,
    required this.model,
    required this.image,
    required this.price,
    this.description,
    this.stock,
    this.specs,
    this.status = false,
  });

  void get updateStatus => {status = !status};

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      manufacturer: json["manufacturer"],
      model: json["model"] == null ? "" : json["model"],
      image: json["image"] == null ? "" : json["image"],
      price: double.parse(json["price"].toString()),
      description: json["description"],
      stock: json["stock"],
      specs: json["specs"] == null ? Specs() : Specs.fromJson(json["specs"]),
    );
  }
}
