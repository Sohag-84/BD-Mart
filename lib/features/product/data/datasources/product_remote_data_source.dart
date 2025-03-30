import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/service_locator.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final apiServices = sl<ApiServices>();
  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await apiServices.getApi(fullApiUrl: AppConfig.products);

      if (response['data'] != null) {
        final List<dynamic> product = response['data'];
        return product.map((json) => Product.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unexpected error from product api: $e');
    }
  }
}
