import 'package:deleveryapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  final String name;
  final String price;
  final String number;
  final bool cros;
  final Widget Function() sahifa;
  const Carts({
    super.key,
    required this.name,
    required this.number,
    required this.price,
    required this.sahifa,
    this.cros = false,
  });

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  int count = 0;

  void add() {
    count++;
    setState(() {});
  }

  void remove() {
    if (count > 0) {
      count--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                      Text(
                        "EDIT",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.orangeTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYGKqZ9zOWOY3MBROuf3DjvZtKloRdq5fRqg&s",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Total: ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "\$96",
                        style: TextStyle(
                          fontSize: 30,
                          color:
                              AppColors.secondGreyTextColor,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Breakdown",
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  AppColors.orangeTextColor,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: AppColors.blueTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.orangeTextColor,
                      minimumSize: Size(
                        double.infinity,
                        62,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return widget.sahifa();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Place ORder",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 117,
              width: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(
                  255,
                  29,
                  37,
                  83,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (widget.cros == true)
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 17),
                Row(
                  spacing: 20,
                  children: [
                    Text(
                      "${widget.number}''",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: remove,
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      "$count",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: add,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
