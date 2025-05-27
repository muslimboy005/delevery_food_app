import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/utils/app_images.dart';
import 'package:deleveryapp/view/widgets/canteyner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

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
              height: 25,
            ),
            Container(
              height: 82,
              width: double.infinity,
              color: AppColors.scaffold,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Master Card"),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.miniCart),
                        Text("  ************* 436"),
                        Spacer(),
                        Icon(Icons.arrow_drop_down, color: Colors.black)
                      ],
                    ),
                  ],
                ),
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
            Spacer(),
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
    );
  }
}
