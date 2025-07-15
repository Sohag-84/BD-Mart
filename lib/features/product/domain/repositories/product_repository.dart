import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';

abstract interface class ProductRepository {
  ResultFuture<List<Product>> getProducts({
    required String url,
    required int page,
  });
}
