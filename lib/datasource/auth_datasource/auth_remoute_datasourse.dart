import 'package:firebase_auth/firebase_auth.dart';

class AuthRemouteDatasourse {
  Future<void> loginUser(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      String uid = userCredential.user!.uid;
      print("Login bo‘lgan foydalanuvchi UID: $uid");
    } catch (e) {
      print("Login xatoligi: $e");
    }
  }

  Future<void> registerUser(
    String email,
    String password,
  ) async {
    try {
      // Foydalanuvchini ro‘yxatdan o‘tkazish
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      // UID ni olish
      String uid = userCredential.user!.uid;
      print("Foydalanuvchi UID: $uid");
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }
}
