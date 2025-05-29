import 'package:deleveryapp/view/screens/edit_cart.dart';
import 'package:deleveryapp/view/screens/home.dart';
import 'package:deleveryapp/view/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<Widget> pages = const [
    HomeScreen(),
    EditCart(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap:
                  (index) => context
                      .read<NavigationCubit>()
                      .changePage(index),
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Map',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void changePage(int index) => emit(index);
}
