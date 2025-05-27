class ProductModel {
  String image;
  String name;
  String restaurantName;
  double price;
  String? id;
  ProductModel({
    required this.image,
    required this.name,
    required this.restaurantName,
    required this.price,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "restaurantName": restaurantName,
      "price": price,
    };
  }

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
      image: json["image"],
      name: json["name"],
      restaurantName: json["restaurantName"],
      price: json["price"],
      id: json["id"],
    );
  }
}
