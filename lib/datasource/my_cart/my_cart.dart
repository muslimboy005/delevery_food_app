import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deleveryapp/viewmodel/cart_service.dart';
import 'package:deleveryapp/viewmodel/islog/active_user.dart';

class MyCartData {
  final db = FirebaseFirestore.instance;
  Future<void> addProuct() async {
    print(ActiveUser.instance.value);

    print(CartService.instance.toJson());
    try {
      await db
          .collection(ActiveUser.instance.value)
          .doc("cart1")
          .set(CartService.instance.toJson());
      print("Malumot Qo'shildi");
    } catch (e) {
      print("Malumot Qo'shilmadi\n $e");
    }
  }

  Future<void> getProduct() async {
    print(ActiveUser.instance.value);
    try {
      final data =
          await db
              .collection(ActiveUser.instance.value)
              .doc("cart1")
              .get();
      print(data.data());
      if (data.data() != null) {
        CartService.instance.fromJson(data.data()!);
      }
    } catch (e) {
      print(e);
    }
  }
}
