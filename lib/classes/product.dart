import 'specs.dart';

//Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String model;
  String image;
  int price;
  String manufacturer;
  String description;
  int stock;
  Specs specs;

  Product({
    this.id,
    this.model,
    this.image,
    this.price,
    this.manufacturer,
    this.description,
    this.stock,
    this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      model: json["model"],
      image: json["image"],
      price: json["price"],
      manufacturer: json["manufacturer"],
      description: json["description"],
      stock: json["stock"],
      specs: json['specs'] != null ? Specs.fromJson(json['specs']) : null,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "manufacturer": manufacturer,
  //     "model": model,
  //     "image": image,
  //     "price": price,
  //     "description": description,
  //     "specs": specs.toJson(),
  //     "stock": stock,
  //   };
  // }
}
