abstract class AuthState  {}
class AuthSuccess extends AuthState {
  String id;
  AuthSuccess(this.id);
}
class AuthInitional extends AuthState {}

class AuthLoading extends AuthState {}
class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
