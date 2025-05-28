import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/view/screens/my_cart.dart';
import 'package:deleveryapp/view/widgets/carts.dart';
import 'package:flutter/material.dart';

class EditCart extends StatelessWidget {
  const EditCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgrounBlue,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgrounBlue,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black87),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        actions: [
          Text(
            "EDIT ITEMS",
            style: TextStyle(
              color: AppColors.orangeTextColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 32,
          children: [
            Carts(
              name: "pizza calzone",
              number: "14",
              price: "\$64",
              sahifa: () => MyCart(),
            ),
            Carts(
              name: "pizza calzone",
              number: "14",
              price: "\$32",
              sahifa: () => MyCart(),
            ),
          ],
        ),
      ),
    );
  }
}
