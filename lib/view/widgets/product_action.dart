import 'package:deleveryapp/model/cart_model.dart';
import 'package:deleveryapp/model/product_model.dart';
import 'package:deleveryapp/view/widgets/button.dart';
import 'package:deleveryapp/viewmodel/cart_service.dart';
import 'package:flutter/material.dart';

class ProductActionWidget extends StatefulWidget {
  final num price;
  final ProductModel product;
  final cart = CartService.instance;
  ProductActionWidget({
    super.key,
    required this.product,
    required this.price,
  });

  @override
  State<ProductActionWidget> createState() =>
      _ProductActionWidgetState();
}

class _ProductActionWidgetState
    extends State<ProductActionWidget> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${(widget.price * quantity).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _decrement,
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      iconSize: 20,
                      constraints: BoxConstraints(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _increment,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Button(
            text: "ADD TO CART",
            onTap: () {
              widget.cart.addToCart(
                CartItem(
                  product: widget.product,
                  count: quantity,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
