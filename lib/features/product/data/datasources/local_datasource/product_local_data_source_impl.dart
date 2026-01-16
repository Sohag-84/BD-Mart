import 'package:gym_swat/features/product/data/models/product_obx_entity.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/objectbox.g.dart';
import 'product_local_data_source.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductObxEntity> productBox;

  ProductLocalDataSourceImpl({required this.productBox});

  @override
  Future<List<ProductEntity>> getProducts() async {
    return productBox
        .getAll()
        .map((e) => ProductEntity(
              id: e.id,
              name: e.name,
              thumbnailImage: e.image,
              mainPrice: e.price,
              discount: e.discount,
              rating: e.rating,
            ))
        .toList();
  }

  @override
  Future<void> saveProducts({required List<ProductEntity> products}) async {
    for (final p in products) {
      final existing = productBox
          .query(ProductObxEntity_.productId.equals(p.id ?? 0))
          .build()
          .findFirst();

      if (existing == null) {
        productBox.put(
          ProductObxEntity(
            productId: p.id ?? 0,
            name: p.name ?? '',
            image: p.thumbnailImage ?? '',
            price: p.mainPrice ?? '',
            discount: p.discount ?? '',
            rating: (p.rating ?? 0).toDouble(),
          ),
        );
      }
    }
  }

  @override
  Future<void> clearProducts() async {
    productBox.removeAll();
  }
}
