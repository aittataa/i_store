class Product {
  final int id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final String picture;
  final bool featured;
  final bool status;

  Product({
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.picture,
    this.featured,
    this.status,
  });

  /*
  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: int.parse(data["id_product"]),
      name: data["name"] ?? null,
      tradeName: data["trade_name"] ?? null,
      mainIngredient: data["main_ingredient"] ?? null,
      dose: data["dose"] ?? null,
      quantity: int.parse(data["quantity"]) ?? 0,
      price: double.parse(data["price"]),
      picture: "$URL_SERVER/images/${data["picture"]}",
      featured: data["featured"] == "1",
      status: data["status"] == "1",
      description: data["description"],
      dosageType: data["dosageform_type"] ?? null,
      medicineID: data["id_medcategory"] != null ? int.parse(data["id_medcategory"]) : 0,
      medicineTitle: data["medcategory_title"] ?? null,
      subcategoryID: data["id_subcategory"] != null ? int.parse(data["id_subcategory"]) : 0,
      subcategoryTitle: data["subcategory_title"] ?? null,
      brandID: data["id_subcategory"] != null ? int.parse(data["id_brand"]) : 0,
      brandTitle: data["brand_title"] ?? null,
      isFav: data["favorite_status"] == "1" ?? false,
      isShop: int.parse(data["shop"]),
    );
  }
  */
}
