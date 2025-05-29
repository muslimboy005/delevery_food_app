import 'package:deleveryapp/model/cart_model.dart';
import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/view/screens/payment_method_no_mastercard.dart';
import 'package:deleveryapp/viewmodel/cart_service.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem> cartItems = [];
  final cart = CartService.instance;

  @override
  void initState() {
    super.initState();
    cartItems = cart.getCartItems();
  }

  void removeItem(int index) {
    setState(() {
      cart.removeFromCart(index);
      cartItems = cart.getCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgrounBlue,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgrounBlue,
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          itemCount: cartItems.length,
          separatorBuilder:
              (context, index) =>
                  const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      cartItem.product.image,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(
                                Icons.broken_image,
                                size: 64,
                              ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          cartItem.product.restaurantName,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$${cartItem.product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Count: ${cartItem.count}",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => removeItem(index),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greenTextColor,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) =>
                        const PaymentMethodNoMastercard(),
              ),
            );
          },
          child: const Text(
            "Go to Payment",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
