import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/home/view/data/product_model.dart';

class ProductRepo {
  ApiService apiService = ApiService();
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.get('/products');
      return (response['data'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
