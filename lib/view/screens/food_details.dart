import 'package:deleveryapp/view/widgets/restaurant_info.dart';
import 'package:deleveryapp/view/widgets/button.dart';
import 'package:deleveryapp/view/widgets/food_info.dart';
import 'package:deleveryapp/view/widgets/info_row.dart';
import 'package:deleveryapp/view/widgets/ingredient_selection.dart';
import 'package:deleveryapp/view/widgets/size_selection.dart';
import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() =>
      FoodDetailsScreenState();
}

class FoodDetailsScreenState
    extends State<FoodDetailsScreen> {
  int quantity = 2;
  String selectedSize = "14\"";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 30,
                        right: 30,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),

                            Text(
                              "Details",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        RestaurantInfo(),
                        SizedBox(height: 20),
                        FoodInfo(),
                        SizedBox(height: 20),
                        InfoRow(),
                        SizedBox(height: 25),
                        SizeSelection(
                          selectedSize: selectedSize,
                          onSizeChanged: (size) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        ),
                        SizedBox(height: 25),
                        IngredientsSection(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Button(text: "ADD TO CART", onTap: () {}),
        ],
      ),
    );
  }
}
