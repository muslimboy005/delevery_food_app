part of 'onboarding_cubit.dart';

class OnboardingState {
  final int index;
  OnboardingState({required this.index});
  OnboardingState copyWith({int? index}) =>
      OnboardingState(index: index ?? this.index);
}
