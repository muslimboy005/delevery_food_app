import 'package:deleveryapp/view/screens/varification_screen.dart';
import 'package:deleveryapp/view/widgets/button.dart';
import 'package:deleveryapp/view/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      ForgotPasswordScreenState();
}

class ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Text(
                      "Please sign in to your existing account",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 600,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  CustomTextField(
                    label: "EMAIL",
                    hint: "example@gmail.com",
                    controller: emailController,
                  ),
                  SizedBox(height: 32),
                  Button(
                    text: "SEND CODE",
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(
                              email: emailController.text,
                            );
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                "📧 Parolni tiklash uchun havola emailga yuborildi.",
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                "❌ Xatolik: $e",
                              ),
                            ),
                          );
                        }
                      }
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    VerificationScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
