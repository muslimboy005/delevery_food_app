import 'package:deleveryapp/model/product_model.dart';
abstract class ProductState  {}
class ProductSuccess extends ProductState {
 final List<ProductModel> products;
  ProductSuccess(this.products);
}
class ProductLoading extends ProductState {}
class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
