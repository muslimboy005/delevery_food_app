import 'package:deleveryapp/datasource/my_cart/my_cart.dart';
import 'package:deleveryapp/utils/app_images.dart';
import 'package:deleveryapp/view/screens/my_home_page.dart';
import 'package:deleveryapp/view/screens/onboarding_screen.dart';
import 'package:deleveryapp/viewmodel/islog/active_user.dart';
import 'package:deleveryapp/viewmodel/islog/islog.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;
  final auth = AuthLocalService();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        _opacity = 1;
      });
    });
    pushOnboarding();
  }

  Future<void> pushOnboarding() async {
    await Future.delayed(Duration(seconds: 3));
    String? log =await auth.getUserId();
    print(log);
    if (log != null) {
      print(log);
      ActiveUser.instance.value = log;
    MyCartData().getProduct();

    }
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder:
            (ctx) =>
                log == null
                    ? OnboardingScreen()
                    : MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: _opacity,
                  curve: Curves.linear,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    AppImages.splash1,
                    width: 180,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: 160,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: _opacity,
                  curve: Curves.linear,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    AppImages.splash2,
                    width: 260,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
