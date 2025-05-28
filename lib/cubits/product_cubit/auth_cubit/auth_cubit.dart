import 'package:deleveryapp/cubits/product_cubit/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitional());
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user.user!.uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user.user!.uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
