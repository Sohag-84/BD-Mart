import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/product/data/datasources/product_remote_data_source.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices apiServices;
  const ProductRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<Product>> getProducts({
    required String url,
    required int page,
  }) async {
    try {
      final response = await apiServices.getApi(
        fullApiUrl: "$url?page=$page",
      );
      if (response['data'] != null) {
        final List<dynamic> product = response['data'];
        return product.map((json) => Product.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
