import 'package:deleveryapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Canteyner extends StatelessWidget {
  final String title;
  final String image;
  const Canteyner({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.container,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              image,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(color: AppColors.paymentsTextColor),
        )
      ],
    );
  }
}
