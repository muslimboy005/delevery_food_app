import 'package:deleveryapp/datasource/auth_datasource/auth_remoute_datasourse.dart';
import 'package:deleveryapp/viewmodel/cubits/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemouteDatasourse authRemouteDatasourse =
      AuthRemouteDatasourse();
  AuthCubit() : super(AuthInitional());
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      authRemouteDatasourse.loginUser(email, password);

      emit(AuthSuccess(""));
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
      authRemouteDatasourse.registerUser(email, password);
      emit(AuthSuccess(""));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
