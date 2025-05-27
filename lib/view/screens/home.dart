import 'package:deleveryapp/cubits/product_cubit/product_cubit.dart';
import 'package:deleveryapp/cubits/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> foods = List.generate(
    10,
    (index) {
      return {
        'name': index % 2 == 0 ? 'Pizza' : 'Burger',
        'price': index % 2 == 0 ? 70 : 50,
      };
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 40,
          right: 25,
          left: 25,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.menu, size: 28),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DELIVER TO",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Halal Lab office",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Dialog(
                                    backgroundColor:
                                        Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                            16,
                                          ),
                                    ),
                                    child: SizedBox(
                                      width:
                                          double.infinity,
                                      height: 500,
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(
                                                top: 100,
                                                left: 20,
                                                right: 20,
                                                bottom: 20,
                                              ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Hurry Offers!",
                                                style: TextStyle(
                                                  color:
                                                      Colors
                                                          .white,
                                                  fontSize:
                                                      45,
                                                  fontWeight:
                                                      FontWeight
                                                          .bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Text(
                                                "#1243CD2",
                                                style: TextStyle(
                                                  color:
                                                      Colors
                                                          .white,
                                                  fontSize:
                                                      35,
                                                  fontWeight:
                                                      FontWeight
                                                          .bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "Use the cupon get 25% discount",
                                                style: TextStyle(
                                                  color:
                                                      Colors
                                                          .white,
                                                  fontSize:
                                                      20,
                                                  fontWeight:
                                                      FontWeight
                                                          .bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              ElevatedButton(
                                                onPressed:
                                                    () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors
                                                          .orange,
                                                  minimumSize:
                                                      const Size(
                                                        double.infinity,
                                                        75,
                                                      ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  side: BorderSide(
                                                    color:
                                                        Colors.white,
                                                    width:
                                                        3,
                                                  ),
                                                ),
                                                child: Text(
                                                  "GOT IT",
                                                  style: TextStyle(
                                                    fontSize:
                                                        20,
                                                    color:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 30,
                                    top: 142,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop();
                                      },
                                      icon: Icon(
                                        Icons
                                            .highlight_remove,
                                        size: 65,
                                        color:
                                            Colors
                                                .deepOrange,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Hey Halal,",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " Good Afternoon!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "Search dishes, restaurants",
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 230,
                child: BlocBuilder<
                  ProductCubit,
                  ProductState
                >(
                  builder: (context, state) {
                    if (state is ProductSuccess) {
                      final foods = state.products;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          final item = foods[index];
                          return Container(
                            width: 160,
                            margin: EdgeInsets.only(
                              right: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Container(
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(
                                            10,
                                          ),
                                    ),
                                    child: Image.network(
                                      item.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                    children: [
                                      Text(
                                        "Starting",
                                        style: TextStyle(
                                          color:
                                              Colors
                                                  .black45,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "\$${item.price}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Open Restaurants",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rose Garden Restaurant",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Burger · Chicken · Rice · Wings",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 24,
                      ),
                      Text(
                        "4.7  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.delivery_dining,
                        color: Colors.orange,
                        size: 24,
                      ),
                      Text(
                        " Free  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.access_time,
                        color: Colors.orange,
                        size: 24,
                      ),
                      Text(
                        " 20 min",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
