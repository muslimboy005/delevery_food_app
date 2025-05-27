import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/view/screens/payment_method_no_mastercard.dart';
import 'package:deleveryapp/view/widgets/carts.dart';
import 'package:flutter/material.dart';


class MyCart extends StatelessWidget {
  const MyCart({super.key});

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
            )),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        actions: [
          Text(
            "DONE",
            style: TextStyle(
              color: AppColors.greenTextColor,
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
              name: "Pizza calzone european",
              number: "14",
              price: "\$64",
              sahifa: () => PaymentMethodNoMastercard(),
              cros: true,
            ),
            Carts(
              name: "Pizza calzone european",
              sahifa: () => PaymentMethodNoMastercard(),
              number: "14",
              price: "\$32",
              cros: true,
            ),
          ],
        ),
      ),
    );
  }
}
