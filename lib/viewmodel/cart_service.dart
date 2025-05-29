import 'package:deleveryapp/datasource/my_cart/my_cart.dart';
import 'package:deleveryapp/model/cart_model.dart';

class CartService {
  final db = MyCartData();
  CartService._internal();

  static final CartService _instance =
      CartService._internal();

  static CartService get instance => _instance;

  final List<CartItem> _cartItems = [];

  List<CartItem> getCartItems() {
    return _cartItems;
  }

  void addToCart(CartItem item) {
    _cartItems.add(item);
    try {
      db.addProuct();
    } catch (e) {
      print(e);
    }
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    try {
      db.addProuct();
    } catch (e) {
      print(e);
    }
  }

  void clearCart() {
    _cartItems.clear();
  }

  Map<String, dynamic> toJson() {
    return {
      "cartItems":
          _cartItems.map((item) => item.toJson()).toList(),
    };
  }

  void fromJson(Map json) {
    final jsonList = json['cartItems'] as List;
    _cartItems.clear();
    _cartItems.addAll(
      jsonList.map((e) => CartItem.fromJson(e)).toList(),
    );
  }
}
