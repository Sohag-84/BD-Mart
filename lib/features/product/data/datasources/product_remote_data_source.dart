import 'package:gym_swat/features/product/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<Product>> getProducts({
    required String url,
    required int page,
  });
}
