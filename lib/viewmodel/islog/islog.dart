import 'package:shared_preferences/shared_preferences.dart';

class Islog {
  Future<String?> islog() async {
    final ins = await SharedPreferences.getInstance();
    final islog = ins.getString("islog");
    return islog;
  }

  Future<void> logout() async {
    final ins = await SharedPreferences.getInstance();
    await ins.remove("islog");
  }

  Future<void> login({required String userId}) async {
    print(
      "----------------------------------------------------",
    );
    print(
      "----------------------------------------------------",
    );
    print(
      "----------------------------------------------------",
    );

    print(userId);
    print(
      "----------------------------------------------------",
    );
    print(
      "----------------------------------------------------",
    );
    print(
      "----------------------------------------------------",
    );

    final ins = await SharedPreferences.getInstance();
    await ins.setString("islog", userId);
  }
}
