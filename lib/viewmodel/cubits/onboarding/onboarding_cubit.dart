import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(index: 0));
  void incrament() {
    final newIndex = state.index + 1;
    if (newIndex < 4) {
      emit(OnboardingState(index: newIndex));
    }
  }
}
