import 'package:deleveryapp/cubits/product_cubit/product_state.dart';
import 'package:deleveryapp/datasource/get_productdatasource/get_productdatasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());
  final getProductDatasource = GetProductdatasource();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> getProduct() async {
    try {
      emit(ProductLoading());
      print("Malumotlar Olindi emit");
      final products =
          await getProductDatasource.getProduct();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
