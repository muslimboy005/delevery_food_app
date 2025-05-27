import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/utils/app_images.dart';
import 'package:deleveryapp/view/widgets/canteyner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodNoMastercard extends StatelessWidget {
  const PaymentMethodNoMastercard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Payment",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColors.blueTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: [
                    Canteyner(image: AppImages.cash, title: "Cash"),
                    Canteyner(image: AppImages.visa, title: "Visa"),
                    Canteyner(image: AppImages.masterCard, title: "Mastercard"),
                    Canteyner(image: AppImages.paypal, title: "PayPal"),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: AppColors.scaffold,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.cart,
                      height: 250,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "No master card added",
                      style: TextStyle(
                          color: AppColors.blueTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "You can add a mastercard and save it for later",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 62)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.orangeTextColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add New",
                      style: TextStyle(
                          color: AppColors.orangeTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 74,
              ),
              Row(
                children: [
                  Text(
                    "Total: ",
                    style:
                        TextStyle(fontSize: 14, color: AppColors.greyTextColor),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "\$96",
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.secondGreyTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orangeTextColor,
                    minimumSize: Size(double.infinity, 62)),
                onPressed: () {},
                child: Text(
                  "Pay & Confirm",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
