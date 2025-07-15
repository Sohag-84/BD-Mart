import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class GetProductDetailsUsecase
    implements Usecase<List<ProductDetailsEntity>, ProductIdParam> {
  final ProductRepository productRepository;
  const GetProductDetailsUsecase({required this.productRepository});

  @override
  ResultFuture<List<ProductDetailsEntity>> call(ProductIdParam params) async {
    return await productRepository.getProductDetails(
      productId: params.productId,
    );
  }
}

class ProductIdParam {
  final String productId;
  const ProductIdParam({required this.productId});
}
