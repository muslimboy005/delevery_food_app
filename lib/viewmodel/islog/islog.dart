import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalService {
  static const _key = "user_id";

  Future<void> login( {required String userId}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, userId);
    print("✅ Login: $userId");
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    print("🚪 Logged out");
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_key);
    print("🔐 User ID: $userId");
    return userId;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_key);
  }
}
