import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deleveryapp/model/product_model.dart';

class GetProductdatasource {
  final db = FirebaseFirestore.instance;
  Future<void> addProuct(ProductModel product) async {
     product = ProductModel(
      image:
          "https://masterpiecer-images.s3.yandex.net/63aee5916efa11eea7405696910b1137:upscaled",
      name: "Gamburger",
      restaurantName: "Evos",
      price: 14.36,
    );
    try {
      await db.collection("products").add(product.toJson());
      print("Malumot Qo'shildi");
    } catch (e) {
      print("Malumot Qo'shilmadi\n $e");
    }
  }

  Future<List<ProductModel>> getProduct() async {
    print("Malumotlar Olindi");
    final data = await db.collection("products").get();
    List<ProductModel> products = [];
    for (var doc in data.docs) {
      Map<String, dynamic> product = doc.data();
      product["id"] = doc.id;
      products.add(ProductModel.fromJson(product));
    }
    print(products);
    return products;
  }
}
