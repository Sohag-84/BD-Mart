import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';

class GetProductUsecase
    implements Usecase<List<Product>, ProductPaginationParams> {
  final ProductRepository productRepository;
  const GetProductUsecase({required this.productRepository});

  @override
  ResultFuture<List<Product>> call(ProductPaginationParams params) async {
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
