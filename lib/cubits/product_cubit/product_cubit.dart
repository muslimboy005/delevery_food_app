import 'package:deleveryapp/cubits/product_cubit/product_state.dart';
import 'package:deleveryapp/datasource/get_productdatasource/get_productdatasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit():super(ProductLoading());
  final getProductDatasource=GetProductdatasource();

  Future<void> getProduct()async{
    try {
      emit(ProductLoading());
      final products=await getProductDatasource.getProduct();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

}