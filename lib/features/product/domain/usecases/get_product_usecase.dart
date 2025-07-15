import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class GetProductUsecase
    implements Usecase<List<ProductEntity>, ProductPaginationParams> {
  final ProductRepository productRepository;
  const GetProductUsecase({required this.productRepository});

  @override
  ResultFuture<List<ProductEntity>> call(ProductPaginationParams params) async {
    return await productRepository.getProducts(
      url: params.url,
      page: params.page,
    );
  }
}

class ProductPaginationParams {
  final String url;
  final int page;

  ProductPaginationParams({
    required this.url,
    required this.page,
  });
}
