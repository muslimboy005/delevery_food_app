import 'package:deleveryapp/view/widgets/burger_card.dart';
import 'package:deleveryapp/view/widgets/header_section.dart';
import 'package:deleveryapp/view/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            SizedBox(height: 30),
            Text(
              "Popular Burgers",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                childAspectRatio: 0.75,
                children: [
                  BurgerCard(
                    title: "Burger Bistro",
                    restaurant: "Rose Garden",
                    price: "\$40",
                  ),
                  BurgerCard(
                    title: "Smokin' Burger",
                    restaurant: "Cafenia Restaurant",
                    price: "\$60",
                  ),
                  BurgerCard(
                    title: "Buffalo Burgers",
                    restaurant: "Kaji Firm Kitchen",
                    price: "\$75",
                  ),
                  BurgerCard(
                    title: "Bullseye Burgers",
                    restaurant: "Kebab Restaurant",
                    price: "\$94",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Open Restaurants",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 15),
            RestaurantCard(),
          ],
        ),
      ),
    );
  }
}
