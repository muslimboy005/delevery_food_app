import 'package:deleveryapp/utils/app_colors.dart';
import 'package:deleveryapp/utils/app_images.dart';
import 'package:deleveryapp/utils/sizedbox_extation.dart';
import 'package:deleveryapp/view/screens/login_screen.dart';
import 'package:deleveryapp/viewmodel/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  List<String> images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
    AppImages.onboarding4,
  ];
  List<String> primaryText = [
    "All your favorites",
    "All your favorites",
    "Order from choosen chef",
    "Free delivery offers",
  ];
  List<String> secondaryText = [
    "Get all your loved foods in one once place, you just place the orer we do the rest",
    "Get all your loved foods in one once place, you just place the orer we do the rest",
    "Get all your loved foods in one once place, you just place the orer we do the rest",
    "Get all your loved foods in one once place, you just place the orer we do the rest",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Center(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  114.h,
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 292,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: BlocBuilder<
                      OnboardingCubit,
                      OnboardingState
                    >(
                      builder: (context, state) {
                        return Image.asset(
                          images[state.index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  63.h,
                  BlocBuilder<
                    OnboardingCubit,
                    OnboardingState
                  >(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text(
                            primaryText[state.index],
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          18.h,
                          Text(
                            secondaryText[state.index],
                            style: TextStyle(
                              color:
                                  AppColors.secondaryText,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          32.h,
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            spacing: 12,
                            children: [
                              for (
                                int i = 0;
                                i < images.length;
                                i++
                              )
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      i == state.index
                                          ? AppColors
                                              .activeorange
                                          : AppColors
                                              .passiveorange,
                                ),
                            ],
                          ),
                          59.h,
                          GestureDetector(
                            onTap: () {
                              state.index == 3
                                  ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (ctx) =>
                                              LoginScreen(),
                                    ),
                                  )
                                  : context
                                      .read<
                                        OnboardingCubit
                                      >()
                                      .incrament();
                            },
                            child: Container(
                              height: 62,
                              width: 327,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(
                                      12,
                                    ),
                                color:
                                    AppColors.activeorange,
                              ),
                              child: Center(
                                child: BlocBuilder<
                                  OnboardingCubit,
                                  OnboardingState
                                >(
                                  builder: (
                                    context,
                                    state,
                                  ) {
                                    return Text(
                                      state.index == 3
                                          ? "Get Started"
                                              .toUpperCase()
                                          : "Next"
                                              .toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                            FontWeight.w700,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          16.h,
                          if (state.index < 3)
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (ctx) =>
                                            LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      AppColors
                                          .secondaryText,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
