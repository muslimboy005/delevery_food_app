import 'package:deleveryapp/viewmodel/cubits/auth_cubit/auth_cubit.dart';
import 'package:deleveryapp/viewmodel/cubits/auth_cubit/auth_state.dart';
import 'package:deleveryapp/view/screens/my_home_page.dart';
import 'package:deleveryapp/view/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();
  bool isPasswordObscured = true;

  bool isRetypePasswordObscured = true;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
                onPressed: () {},
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
                    "Sign Up",
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
                      "Please sign up to get started",
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
              height: 650,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 4,
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
                    label: "NAME",
                    hint: "john doe",
                    controller: nameController,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    label: "EMAIL",
                    hint: "example@gmail.com",
                    controller: emailController,
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    label: "PASSWORD",
                    hint: "••••••••••••",
                    controller: passwordController,
                    obscure: isPasswordObscured,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordObscured =
                              !isPasswordObscured;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 16),

                  CustomTextField(
                    label: "RE-TYPE PASSWORD",
                    hint: "••••••••••••",
                    controller: retypePasswordController,
                    obscure: isRetypePasswordObscured,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isRetypePasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isRetypePasswordObscured =
                              !isRetypePasswordObscured;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<
                      AuthCubit,
                      AuthState
                    >(
                      builder: (context, state) {
                        Widget child;

                        if (state is AuthLoading) {
                          child = CircularProgressIndicator(
                            color: Colors.white,
                          );
                        } else if (state is AuthSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (ctx) => MyHomePage(),
                            ),
                          );
                          child = Text(
                            "Success",
                          ); // HomeScreen() bu yerda noto‘g‘ri bo‘ladi
                        } else if (state is AuthError) {
                          child = Text(
                            "bunday foydalanuvchi mavjud emas",
                          );
                        } else {
                          child = Text("Sign In");
                        }

                        return FilledButton(
                          onPressed: () {
                            context
                                .read<AuthCubit>()
                                .register(
                                  email:
                                      emailController.text,
                                  password:
                                      passwordController
                                          .text,
                                );
                          },
                          child: child,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }
}
