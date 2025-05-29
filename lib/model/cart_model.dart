import 'product_model.dart';

class CartItem {
  final ProductModel product;
  int count;

  CartItem({required this.product, this.count = 1});

  Map<String, dynamic> toJson() {
    return {
      "product": product.toJson(),
      "count": count,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: ProductModel.fromJson(json["product"]),
      count: json["count"],
    );
  }
}
