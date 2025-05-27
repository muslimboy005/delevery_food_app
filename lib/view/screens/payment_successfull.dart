import 'package:deleveryapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentSuccessfull extends StatelessWidget {
  const PaymentSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
        child: Column(
          children: [
            Spacer(),
            Container(
              height: 207,
              width: 228,
              decoration: BoxDecoration(
                  color: AppColors.greyCont,
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Congratulations!",
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.blueTextColor,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "You successfully maked a payment, enjoy our service!",
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeTextColor,
                  minimumSize: Size(double.infinity, 62)),
              onPressed: () {},
              child: Text(
                "Track Order",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
