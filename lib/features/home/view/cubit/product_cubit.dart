import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_app/features/home/view/data/product_model.dart';
import 'package:hungry_app/features/home/view/data/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  ProductRepo productRepo = ProductRepo();

  Future<List<ProductModel>> getAllProducts() async {
    emit(ProductLoading());
    try {
      final products = await productRepo.getProducts();
      emit(ProductLoaded(products: products));
      return products;
    } catch (e) {
      emit(ProductError(message: e.toString()));
      return [];
    }
  }
}
