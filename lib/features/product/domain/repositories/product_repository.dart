import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';

abstract interface class ProductRepository {
  ResultFuture<List<ProductEntity>> getProducts({
    required String url,
    required int page,
  });

  ResultFuture<List<ProductDetailsEntity>> getProductDetails({
    required String productId,
  });
}
