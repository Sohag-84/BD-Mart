import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<Product>> getProducts({
    required String url,
    required int page,
  });

  Future<List<ProductDetailsEntity>> getProductDetails({
    required String productId,
  });
}
