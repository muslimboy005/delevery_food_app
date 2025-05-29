import 'package:deleveryapp/viewmodel/cubits/product_cubit/product_cubit.dart';
import 'package:deleveryapp/viewmodel/cubits/product_cubit/product_state.dart';
import 'package:deleveryapp/model/product_model.dart';
import 'package:deleveryapp/view/screens/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 40, 25, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 30),
              _buildGreeting(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 30),
              _buildCategoryTitle(),
              const SizedBox(height: 30),
              _buildProductList(),
              const SizedBox(height: 40),
              _buildRestaurantTitle(),
              const SizedBox(height: 25),
              _buildRestaurantImage(),
              const SizedBox(height: 15),
              _buildRestaurantDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.menu, size: 28),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton(
              onPressed: () => _showOfferDialog(context),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Text(
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
    );
  }

  Widget _buildGreeting() {
    return Row(
      children: const [
        Text("Hey Halal,", style: TextStyle(fontSize: 20)),
        Text(
          " Good Afternoon!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search dishes, restaurants",
                hintStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle() {
    return Row(
      children: const [
        Text(
          "All Categories",
          style: TextStyle(fontSize: 22),
        ),
        Spacer(),
        Text("See All", style: TextStyle(fontSize: 17)),
        Icon(Icons.navigate_next),
      ],
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 230,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            final products = state.products;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return _buildProductItem(item);
              },
            );
          } else if (state is ProductError) {
            return Center(
              child: Text("Error loading products"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildProductItem(ProductModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (_) => FoodDetailsScreen(product: item),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Starting",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\$${item.price}",
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantTitle() {
    return Row(
      children: const [
        Text(
          "Open Restaurants",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Text("See All", style: TextStyle(fontSize: 17)),
        Icon(Icons.navigate_next),
      ],
    );
  }

  Widget _buildRestaurantImage() {
    return Container(
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/2e/87/0d/getlstd-property-photo.jpg?w=900&h=500&s=1",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildRestaurantDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
            Text("4.7  ", style: TextStyle(fontSize: 16)),
            Icon(
              Icons.delivery_dining,
              color: Colors.orange,
              size: 24,
            ),
            Text(" Free  ", style: TextStyle(fontSize: 16)),
            Icon(
              Icons.access_time,
              color: Colors.orange,
              size: 24,
            ),
            Text(" 20 min", style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }

  void _showOfferDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Dialog(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ).copyWith(top: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Hurry Offers!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      "#1243CD2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Use the coupon get 25% discount",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed:
                          () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(
                          double.infinity,
                          75,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: const Text(
                        "GOT IT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30,
              top: 142,
              child: IconButton(
                onPressed:
                    () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.highlight_remove,
                  size: 65,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
