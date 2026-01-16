import 'package:gym_swat/features/product/domain/entity/product_entity.dart';

abstract interface class ProductLocalDataSource {
  Future<List<ProductEntity>> getProducts();
  Future<void> saveProducts({required List<ProductEntity> products});
  Future<void> clearProducts();
}
