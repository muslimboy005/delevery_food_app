
import 'package:deleveryapp/view/widgets/dialog.dart';
import 'package:deleveryapp/view/widgets/food_card.dart';
import 'package:deleveryapp/view/widgets/keyword_chip.dart';
import 'package:deleveryapp/view/widgets/restorant_item.dart';
import 'package:deleveryapp/view/widgets/search.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 40, right: 25, left: 25, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 24),
                ),
                SizedBox(width: 10),
                Text(
                  "Search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => OfferDialog(),
                        );
                      },
                      icon: Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            SearchInputField(controller: _searchController),
            SizedBox(height: 30),
            Text(
              "Recent Keywords",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  KeywordChip(text: "Burger"),
                  SizedBox(width: 10),
                  KeywordChip(text: "Sandwich"),
                  SizedBox(width: 10),
                  KeywordChip(text: "Pizza"),
                  SizedBox(width: 10),
                  KeywordChip(text: "Coffee"),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Suggested Restaurants",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            RestaurantItem(name: "Pansi Restaurant", rating: 4.7),
            SizedBox(height: 15),
            RestaurantItem(name: "American Spicy Burger Shop", rating: 4.3),
            SizedBox(height: 15),
            RestaurantItem(name: "Cafenia Coffee Club", rating: 4.0),
            SizedBox(height: 30),
            Text(
              "Popular Fast Food",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: FoodCard(
                    title: "European Pizza",
                    subtitle: "Uttora Coffee House",
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: FoodCard(
                    title: "Buffalo Pizza",
                    subtitle: "Cafenia Coffee Club",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
