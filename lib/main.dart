import 'package:deleveryapp/view/screens/add_card.dart';
import 'package:deleveryapp/view/screens/splash_screen.dart';
import 'package:deleveryapp/viewmodel/cubits/auth_cubit/auth_cubit.dart';
import 'package:deleveryapp/viewmodel/cubits/product_cubit/product_cubit.dart';
import 'package:deleveryapp/viewmodel/cubits/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocProvider(create: (_) => OnboardingCubit());

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
