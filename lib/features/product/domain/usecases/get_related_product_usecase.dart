import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class GetRelatedProductUsecase
    implements Usecase<List<ProductEntity>, ProductIdParam> {
  final ProductRepository productRepository;
  const GetRelatedProductUsecase({required this.productRepository});

  @override
  ResultFuture<List<ProductEntity>> call(ProductIdParam params) async {
    return await productRepository.getRelatedProducts(
      productId: params.productId,
    );
  }
}

class ProductIdParam {
  final String productId;
  const ProductIdParam({required this.productId});
}
