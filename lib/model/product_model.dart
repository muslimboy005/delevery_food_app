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
      "id": id,
      "image": image,
      "name": name,
      "restaurantName": restaurantName,
      "price": price,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      restaurantName: json["restaurantName"],
      price: (json["price"] as num).toDouble(), // type safety
    );
  }
}
